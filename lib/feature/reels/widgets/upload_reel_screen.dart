import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:instagram_app/base/dependency/app_service.dart';
import 'package:instagram_app/shared/providers/user_provider.dart';
import 'package:instagram_app/shared/services/upload_reel_service.dart';

class UploadReelScreen extends ConsumerStatefulWidget {
  const UploadReelScreen({super.key});

  @override
  ConsumerState<UploadReelScreen> createState() => _UploadReelScreenState();
}

class _UploadReelScreenState extends ConsumerState<UploadReelScreen> {
  File? _videoFile;
  VideoPlayerController? _videoController;
  ChewieController? _chewieController;
  final captionController = TextEditingController();
  bool _loading = false;
  String? _uploadedUrl;

  Future<void> _pickVideo() async {
    final picker = ImagePicker();
    final picked = await picker.pickVideo(source: ImageSource.gallery);

    if (picked != null) {
      _videoFile = File(picked.path);

      // Giải phóng controller cũ
      _videoController?.dispose();
      _chewieController?.dispose();

      _videoController = VideoPlayerController.file(_videoFile!);
      await _videoController!.initialize();

      _chewieController = ChewieController(
        videoPlayerController: _videoController!,
        autoPlay: true,
        looping: true,
        showControls: true,
      );

      setState(() {});
    }
  }

  Future<void> _uploadVideo() async {
    if (_videoFile == null) return;

    final user = ref.read(userProvider);
    final toast = ref.read(AppService.toast);

    setState(() => _loading = true);

    try {
      final url = await ReelService().uploadReel(
        videoFile: _videoFile!,
        uid: user.uid,
        caption: captionController.text,
      );

      _uploadedUrl = url;

      // Reset player với video online
      _videoController?.dispose();
      _chewieController?.dispose();

      _videoController = VideoPlayerController.networkUrl(Uri.parse(url));
      await _videoController!.initialize();

      _chewieController = ChewieController(
        videoPlayerController: _videoController!,
        autoPlay: true,
        looping: true,
        showControls: true,
      );

      setState(() {
        _loading = false;
      });

      toast.showText(message: 'Đăng video thành công!');
    } catch (e) {
      setState(() => _loading = false);
      toast.showText(message: 'Đăng thất bại: $e');
    }
  }

  @override
  void dispose() {
    captionController.dispose();
    _videoController?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Tạo Reels"),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // --- PREVIEW VIDEO ---
            GestureDetector(
              onTap: _pickVideo,
              child: Container(
                height: size.width * 1.3,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey.shade200,
                ),
                child:
                    _chewieController != null &&
                            _videoController != null &&
                            _videoController!.value.isInitialized
                        ? ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Chewie(controller: _chewieController!),
                              Container(
                                color: Colors.black26,
                                padding: const EdgeInsets.all(8),
                                child: const Text(
                                  'Nhấn để chọn lại video',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                        : Center(
                          child: Text(
                            'Chọn video để đăng',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
              ),
            ),
            const SizedBox(height: 20),

            // --- CAPTION FIELD ---
            TextField(
              controller: captionController,
              maxLines: 2,
              decoration: InputDecoration(
                hintText: 'Viết caption...',
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.all(14),
              ),
            ),
            const SizedBox(height: 25),

            // --- BUTTON ---
            _loading
                ? const CircularProgressIndicator()
                : SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: _uploadVideo,
                    child: const Text(
                      'Đăng video',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

            const SizedBox(height: 30),

            // --- HIỂN THỊ VIDEO SAU KHI UPLOAD ---
            if (_uploadedUrl != null &&
                _chewieController != null &&
                _videoController != null)
              Column(
                children: [
                  const Divider(height: 40),
                  const Text(
                    "Xem lại video bạn vừa đăng:",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 12),
                  AspectRatio(
                    aspectRatio: _videoController!.value.aspectRatio,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Chewie(controller: _chewieController!),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    captionController.text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

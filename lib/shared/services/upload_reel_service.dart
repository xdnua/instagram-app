import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ReelService {
  Future<String> uploadReel({
    required File videoFile,
    required String uid,
    required String caption,
  }) async {
    final fileName = '${DateTime.now().millisecondsSinceEpoch}.mp4';
    final storageRef = FirebaseStorage.instance.ref().child('reels/$fileName');

    // Gắn metadata để Firebase hiểu là video MP4
    final metadata = SettableMetadata(contentType: 'video/mp4');

    final uploadTask = await storageRef.putFile(videoFile, metadata);
    final downloadUrl = await uploadTask.ref.getDownloadURL();

    await FirebaseFirestore.instance.collection('reels').add({
      'videoUrl': downloadUrl,
      'uid': uid,
      'caption': caption,
      'createdAt': FieldValue.serverTimestamp(),
    });

    return downloadUrl;
  }
}

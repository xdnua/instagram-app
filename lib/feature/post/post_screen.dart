import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_app/base/dependency/app_service.dart';

class PostScreen extends ConsumerStatefulWidget {
  const PostScreen({super.key});

  @override
  ConsumerState<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends ConsumerState<PostScreen> {
  List<Favorite> _data = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final apiService = ref.read(AppService.api);
    final (response, error) = await apiService.get("post");

    if (response != null) {
      setState(() {
        _data =
            (response.data as List)
                .map((item) => Favorite.fromJson(item))
                .toList();
      });
    } else {
      debugPrint("Lỗi khi gọi API: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Post Screen')),
      body:
          _data.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                itemCount: _data.length,
                itemBuilder:
                    (context, index) =>
                        ListTile(title: Text(_data[index].name)),
              ),
    );
  }
}

class Favorite {
  final String id;
  final String name;
  final String avatar;

  const Favorite({required this.id, required this.name, required this.avatar});

  factory Favorite.fromJson(Map<String, dynamic> json) {
    return Favorite(id: json['id'], name: json['name'], avatar: json['avatar']);
  }
}

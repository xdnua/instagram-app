import 'package:flutter/material.dart';
import 'package:instagram_app/shared/widgets/avatar/app_circle_avatar.dart';

class ProfilePostItem extends StatelessWidget {
  const ProfilePostItem({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final imageUrl = 'https://picsum.photos/250?image=$index';

    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          // ignore: deprecated_member_use
          barrierColor: Colors.black.withOpacity(0.6), // nền mờ
          builder:
              (_) => GestureDetector(
                onTap: () => Navigator.of(context).pop(), // tap ngoài để đóng
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24), // bo tròn ảnh
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.7,
                      color: Colors.black,
                      child: InteractiveViewer(
                        panEnabled: true,
                        minScale: 1,
                        maxScale: 3,
                        child: Image.network(imageUrl, fit: BoxFit.contain),
                      ),
                    ),
                  ),
                ),
              ),
        );
      },
      child: AppCircleAvatar(url: imageUrl),
    );
  }
}

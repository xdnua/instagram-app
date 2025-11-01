import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_app/base/dependency/app_service.dart';
import 'package:instagram_app/feature/edit_profile/providers/EditProfileFormNotifier.dart';
import 'package:instagram_app/feature/profile/models/user_profile.dart';
import 'package:instagram_app/shared/providers/user_provider.dart';

class FavoriteFollowing extends ConsumerStatefulWidget {
  const FavoriteFollowing({super.key});

  @override
  ConsumerState<FavoriteFollowing> createState() => _FavoriteFollowingState();
}

class _FavoriteFollowingState extends ConsumerState<FavoriteFollowing> {
  List<UserProfile> followingUsers = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchFollowingUsers();
  }

  Future<void> fetchFollowingUsers() async {
    final user = ref.read(userProvider);
    try {
      final usersRef = FirebaseFirestore.instance.collection('users');
      final myDoc = await usersRef.doc(user.uid).get();
      final myFollowingIds = List<String>.from(
        myDoc.data()?['followingIds'] ?? [],
      );

      if (myFollowingIds.isEmpty) {
        setState(() {
          followingUsers = [];
          isLoading = false;
        });
        return;
      }

      final docs = await Future.wait(
        myFollowingIds.map((id) => usersRef.doc(id).get()),
      );
      final users =
          docs
              .where((doc) => doc.exists)
              .map((doc) => UserProfile.fromMap(doc.data()!, doc.id))
              .toList();

      setState(() {
        followingUsers = users;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
    }
  }

  Future<void> unfollow(UserProfile userToUnfollow) async {
    final editNotifier = ref.read(editProfileFormProvider.notifier);

    final user = ref.read(userProvider);
    final toast = ref.read(AppService.toast);

    try {
      final usersRef = FirebaseFirestore.instance.collection('users');

      // 1) Remove my UID khỏi followerIds của user được unfollow
      final updatedFollowerIds = List<String>.from(userToUnfollow.followerIds)
        ..remove(user.uid);
      await usersRef.doc(userToUnfollow.uid).update({
        'followerIds': updatedFollowerIds,
      });

      // 2) Remove UID của userToUnfollow khỏi followingIds của tôi
      final myDoc = await usersRef.doc(user.uid).get();
      final myFollowing = List<String>.from(myDoc.data()?['followingIds'] ?? [])
        ..remove(userToUnfollow.uid);
      await usersRef.doc(user.uid).update({'followingIds': myFollowing});

      // 3) Cập nhật local provider state (để giữ đồng bộ UI toàn app)
      editNotifier.updateFollowingIds(myFollowing);
      editNotifier.saveChanges();

      final editedUser = ref.read(editProfileFormProvider);
      ref.read(userProvider.notifier).setUser(editedUser);

      // 4) Xóa user đó khỏi danh sách hiện tại (nếu còn mounted)
      if (mounted) {
        setState(() {
          followingUsers.removeWhere((u) => u.uid == userToUnfollow.uid);
        });
      }

      // 5) Thông báo
      toast.showText(message: 'Đã unfollow ${userToUnfollow.name}');
    } catch (e) {
      toast.showText(message: 'Unfollow thất bại');
    }
  }

  Widget buildUserCard(UserProfile user) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.grey.withOpacity(0.12),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(radius: 28, backgroundImage: NetworkImage(user.avatar)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  user.username,
                  style: TextStyle(color: Colors.grey[600], fontSize: 13),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => unfollow(user),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey[500],
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Unfollow',
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : followingUsers.isEmpty
              ? const Center(child: Text('Bạn không theo dõi ai cả'))
              : ListView.builder(
                itemCount: followingUsers.length,
                itemBuilder: (_, index) => buildUserCard(followingUsers[index]),
              ),
    );
  }
}

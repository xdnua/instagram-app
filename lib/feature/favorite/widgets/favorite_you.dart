import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_app/base/dependency/app_service.dart';
import 'package:instagram_app/feature/edit_profile/providers/EditProfileFormNotifier.dart';
import 'package:instagram_app/feature/profile/models/user_profile.dart';
import 'package:instagram_app/shared/providers/user_provider.dart';

class FavoriteYou extends ConsumerStatefulWidget {
  const FavoriteYou({super.key});

  @override
  ConsumerState<FavoriteYou> createState() => _FavoriteYouState();
}

class _FavoriteYouState extends ConsumerState<FavoriteYou> {
  List<UserProfile> suggestedUsers = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchSuggestedUsers();
  }

  Future<void> fetchSuggestedUsers() async {
    final user = ref.read(userProvider);
    try {
      final usersRef = FirebaseFirestore.instance.collection('users');

      // lấy danh sách user trừ bản thân
      final snapshot =
          await usersRef
              .where(FieldPath.documentId, isNotEqualTo: user.uid)
              .get();

      final users =
          snapshot.docs
              .map((doc) => UserProfile.fromMap(doc.data(), doc.id))
              .toList();

      final myDoc = await usersRef.doc(user.uid).get();
      final myFollowing = List<String>.from(
        myDoc.data()?['followingIds'] ?? [],
      );

      final notFollowed =
          users.where((u) => !myFollowing.contains(u.uid)).toList();

      if (!mounted) return;
      setState(() {
        suggestedUsers = notFollowed;
        isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => isLoading = false);
    }
  }

  Future<void> followUser(UserProfile userToFollow) async {
    final editNotifier = ref.read(editProfileFormProvider.notifier);
    final user = ref.read(userProvider);
    final toast = ref.read(AppService.toast);

    try {
      final usersRef = FirebaseFirestore.instance.collection('users');

      // 1) Cập nhật followerIds của user được follow
      final targetDoc = await usersRef.doc(userToFollow.uid).get();
      final targetData = UserProfile.fromMap(
        targetDoc.data()!,
        userToFollow.uid,
      );

      final updatedFollowerIds = List<String>.from(targetData.followerIds);
      if (!updatedFollowerIds.contains(user.uid)) {
        updatedFollowerIds.add(user.uid);
        await usersRef.doc(userToFollow.uid).update({
          'followerIds': updatedFollowerIds,
        });
      }

      // 2) Cập nhật followingIds của tôi
      final myDoc = await usersRef.doc(user.uid).get();
      final myFollowing = List<String>.from(
        myDoc.data()?['followingIds'] ?? [],
      );
      if (!myFollowing.contains(userToFollow.uid)) {
        myFollowing.add(userToFollow.uid);
        await usersRef.doc(user.uid).update({'followingIds': myFollowing});
      }

      // 3) Cập nhật local provider để đồng bộ UI toàn app
      editNotifier.updateFollowingIds(myFollowing);
      editNotifier.saveChanges();

      // Cập nhật lại userProvider
      final editedUser = ref.read(editProfileFormProvider);
      ref.read(userProvider.notifier).setUser(editedUser);

      // 4) Cập nhật UI local nếu widget vẫn còn mounted
      if (mounted) {
        setState(() {
          suggestedUsers.removeWhere((u) => u.uid == userToFollow.uid);
        });
      }

      // 5) Thông báo
      toast.showText(message: 'Đã follow ${userToFollow.name}');
    } catch (e) {
      if (mounted) toast.showText(message: 'Follow thất bại');
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
            onTap: () => followUser(user),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Follow',
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
              : suggestedUsers.isEmpty
              ? const Center(child: Text('Không còn gợi ý nào'))
              : ListView.builder(
                itemCount: suggestedUsers.length,
                itemBuilder: (_, index) => buildUserCard(suggestedUsers[index]),
              ),
    );
  }
}

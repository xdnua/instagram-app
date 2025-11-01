import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_app/feature/profile/models/user_profile.dart';
import 'package:instagram_app/shared/providers/user_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final editProfileFormProvider =
    StateNotifierProvider<EditProfileFormNotifier, UserProfile>(
      (ref) => EditProfileFormNotifier(ref.read(userProvider)),
    );

class EditProfileFormNotifier extends StateNotifier<UserProfile> {
  EditProfileFormNotifier(super.user);

  void updateName(String name) => state = state.copyWith(name: name);
  void updateUsername(String username) =>
      state = state.copyWith(username: username);
  void updateWebsite(String website) =>
      state = state.copyWith(website: website);
  void updateBio(String bio) => state = state.copyWith(bio: bio);
  void updatePhone(String phone) => state = state.copyWith(phone: phone);
  void updateGender(String gender) => state = state.copyWith(gender: gender);
  void updatePostIds(List<String> postIds) =>
      state = state.copyWith(postIds: postIds);
  void updateFollowerIds(List<String> followerIds) =>
      state = state.copyWith(followerIds: followerIds);
  void updateFollowingIds(List<String> followingIds) =>
      state = state.copyWith(followingIds: followingIds);

  Future<void> saveChanges() async {
    final docRef = FirebaseFirestore.instance
        .collection('users')
        .doc(state.uid);
    await docRef.update(state.toMap());
  }
}

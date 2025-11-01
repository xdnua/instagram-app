import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_app/feature/profile/models/user_profile.dart';

final emptyUser = UserProfile(
  uid: '',
  name: '',
  username: '',
  email: '',
  avatar: '',
  phone: '',
  gender: '',
  bio: '',
  website: '',
  postIds: [],
  followerIds: [],
  followingIds: [],
);

class UserNotifier extends StateNotifier<UserProfile> {
  UserNotifier() : super(emptyUser);

  void setUser(UserProfile user) => state = user;
  void clear() => state = emptyUser;
}

final userProvider = StateNotifierProvider<UserNotifier, UserProfile>(
  (ref) => UserNotifier(),
);

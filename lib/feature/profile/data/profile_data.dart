import 'package:instagram_app/feature/profile/models/profile_story.dart';
import 'package:instagram_app/feature/profile/models/user.dart';

class ProfileData {
  static User user = const User(
    name: 'Jacob West',
    bio: 'Digital goodies designer @pixsellz\nEverything is designed.',
    avatar: 'assets/images/Instagram_Logo.png',
    numberOfPosts: 54,
    numberOfFollowers: 834,
    numberOfFollowing: 162,
    username: 'jacob_w',
    email: 'jacob.west@gmail.com',
    phone: '+1 202 555 0147',
    gender: 'Male',
  );

  static List<ProfileStory> profileStories = [
    const ProfileStory(
      title: 'Friends',
      image: 'assets/images/Instagram_Gradient.png',
    ),
    const ProfileStory(
      title: 'Sport',
      image: 'assets/images/Instagram_Gradient.png',
    ),
    const ProfileStory(
      title: 'Design',
      image: 'assets/images/Instagram_Gradient.png',
    ),
  ];
}

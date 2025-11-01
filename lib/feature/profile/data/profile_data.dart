import 'package:instagram_app/feature/profile/models/profile_story.dart';
import 'package:instagram_app/feature/profile/models/user_profile.dart';

class ProfileData {
  static UserProfile user = UserProfile(
    uid: '1',
    name: 'Jacob West',
    bio: 'Digital goodies designer @pixsellz\nEverything is designed.',
    avatar: 'assets/images/Instagram_Logo.png',
    postIds: List.generate(54, (index) => 'post_$index'),
    followerIds: List.generate(834, (index) => 'follower_$index'),
    followingIds: List.generate(162, (index) => 'following_$index'),
    username: 'jacob_w',
    email: 'jacob.west@gmail.com',
    phone: '+1 202 555 0147',
    gender: 'Male',
    website: 'www.jacobwest.com',
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

import 'package:instagram_app/feature/home/models/post.dart';
import 'package:instagram_app/feature/home/models/story.dart';

class HomeData {
  static List<Story> stories = [
    const Story(
      name: 'Your Story',
      avatar: 'assets/images/Instagram_Gradient.png',
    ),
    const Story(
      name: 'karennne',
      avatar: 'assets/images/Instagram_Gradient.png',
      isLive: true,
    ),
    const Story(
      name: 'zackjohn',
      avatar: 'assets/images/Instagram_Gradient.png',
    ),
    const Story(
      name: 'kieron_d',
      avatar: 'assets/images/Instagram_Gradient.png',
    ),
    const Story(
      name: 'craig_love',
      avatar: 'assets/images/Instagram_Gradient.png',
    ),
    const Story(
      name: 'karennne',
      avatar: 'assets/images/Instagram_Gradient.png',
    ),
    const Story(
      name: 'zackjohn',
      avatar: 'assets/images/Instagram_Gradient.png',
    ),
    const Story(
      name: 'kieron_d',
      avatar: 'assets/images/Instagram_Gradient.png',
    ),
    const Story(
      name: 'craig_love',
      avatar: 'assets/images/Instagram_Gradient.png',
    ),
  ];

  static List<Post> posts = [
    const Post(
      name: 'joshua_l',
      avatar: 'assets/images/Instagram_Gradient.png',
      address: 'Tokyo, Japan',
      images: [
        'assets/images/Instagram_Gradient.png',
        'assets/images/Instagram_Gradient.png',
        'assets/images/Instagram_Gradient.png',
        'assets/images/Instagram_Gradient.png',
      ],
      comment: 'The game in Japan was amazing and I want to share some photos',
      totallike: 44686,
      like: Like(
        name: 'craig_love',
        avatar: 'assets/images/Instagram_Gradient.png',
      ),
      isOfficial: true,
    ),
    const Post(
      name: 'joshua_l',
      avatar: 'assets/images/Instagram_Gradient.png',
      images: ['assets/images/Instagram_Gradient.png'],
      address: 'Tokyo, Japan',
      comment: 'The game in Japan was amazing and I want to share some photos',
      totallike: 44686,
      like: Like(
        name: 'craig_love',
        avatar: 'assets/images/Instagram_Gradient.png',
      ),
    ),
    const Post(
      name: 'joshua_l',
      avatar: 'assets/images/Instagram_Gradient.png',
      images: ['assets/images/Instagram_Gradient.png'],
      address: 'Tokyo, Japan',
      comment: 'The game in Japan was amazing and I want to share some photos',
      totallike: 44686,
      like: Like(
        name: 'craig_love',
        avatar: 'assets/images/Instagram_Gradient.png',
      ),
    ),
    const Post(
      name: 'joshua_l',
      avatar: 'assets/images/Instagram_Gradient.png',
      images: ['assets/images/Instagram_Gradient.png'],
      address: 'Tokyo, Japan',
      comment: 'The game in Japan was amazing and I want to share some photos',
      totallike: 44686,
      like: Like(
        name: 'craig_love',
        avatar: 'assets/images/Instagram_Gradient.png',
      ),
    ),
  ];
}

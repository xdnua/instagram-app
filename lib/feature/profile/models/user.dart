class User {
  final String name;
  final String username;
  final String email;
  final String avatar;
  final String phone;
  final String gender;
  final String bio;
  final String? website;
  final int numberOfPosts;
  final int numberOfFollowers;
  final int numberOfFollowing;

  const User({
    required this.name,
    required this.username,
    required this.email,
    required this.avatar,
    required this.phone,
    required this.gender,
    required this.bio,
    this.website,
    required this.numberOfPosts,
    required this.numberOfFollowers,
    required this.numberOfFollowing,
  });
}

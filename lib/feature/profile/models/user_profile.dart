import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile {
  final String uid; // thêm uid để nhận dạng user
  final String name;
  final String username;
  final String email;
  final String avatar;
  final String phone;
  final String gender;
  final String bio;
  final String website;
  final List<String> postIds;
  final List<String> followerIds;
  final List<String> followingIds;
  final DateTime createdAt;

  UserProfile({
    required this.uid,
    required this.name,
    required this.username,
    required this.email,
    required this.avatar,
    required this.phone,
    required this.gender,
    required this.bio,
    required this.website,
    this.postIds = const [],
    this.followerIds = const [],
    this.followingIds = const [],
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  // Convert Firestore document to UserProfile
  factory UserProfile.fromMap(Map<String, dynamic> map, String uid) {
    return UserProfile(
      uid: uid,
      name: map['name'] ?? '',
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      avatar: map['avatar'] ?? '',
      phone: map['phone'] ?? '',
      gender: map['gender'] ?? '',
      bio: map['bio'] ?? '',
      website: map['website'],
      postIds: List<String>.from(map['postIds'] ?? []),
      followerIds: List<String>.from(map['followerIds'] ?? []),
      followingIds: List<String>.from(map['followingIds'] ?? []),
      createdAt:
          map['createdAt'] != null
              ? (map['createdAt'] as Timestamp).toDate()
              : DateTime.now(),
    );
  }

  // Convert User to Map to save to Firestore
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'username': username,
      'email': email,
      'avatar': avatar,
      'phone': phone,
      'gender': gender,
      'bio': bio,
      'website': website,
      'postIds': postIds,
      'followerIds': followerIds,
      'followingIds': followingIds,
      'createdAt': createdAt,
    };
  }

  UserProfile copyWith({
    String? uid,
    String? name,
    String? username,
    String? email,
    String? avatar,
    String? phone,
    String? gender,
    String? bio,
    String? website,
    List<String>? postIds,
    List<String>? followerIds,
    List<String>? followingIds,
    DateTime? createdAt,
  }) {
    return UserProfile(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
      bio: bio ?? this.bio,
      website: website ?? this.website,
      postIds: postIds ?? this.postIds,
      followerIds: followerIds ?? this.followerIds,
      followingIds: followingIds ?? this.followingIds,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:instagram_app/base/dependency/local_storage/local_storage_service.dart';
import 'package:instagram_app/base/dependency/toast/toast_service.dart';
import 'package:instagram_app/feature/profile/models/user_profile.dart';
import 'package:instagram_app/shared/providers/user_provider.dart';
import 'package:logger/logger.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<UserProfile> registerWithEmail({
    required String email,
    required String password,
    required String username,
    File? avatarFile,
  }) async {
    final userCred = await _auth.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password,
    );

    final uid = userCred.user!.uid;
    String? avatarUrl;

    if (avatarFile != null) {
      final ref = _storage.ref().child('avatars/$uid.jpg');
      await ref.putFile(avatarFile);
      avatarUrl = await ref.getDownloadURL();
    }

    final user = UserProfile(
      uid: uid,
      name: '',
      username: username,
      email: email.trim(),
      avatar: avatarUrl ?? '',
      phone: '',
      gender: '',
      bio: '',
      website: '',
      postIds: const [],
      followerIds: const [],
      followingIds: const [],
      createdAt: DateTime.now(),
    );

    await _firestore.collection('users').doc(uid).set(user.toMap());

    return user;
  }

  Future<UserCredential> loginWithEmail({
    required String email,
    required String password,
  }) async {
    final userCred = await _auth.signInWithEmailAndPassword(
      email: email.trim(),
      password: password,
    );
    return userCred;
  }

  Future<void> loginWithGoogle(WidgetRef ref) async {
    final toast = ToastService();
    try {
      toast.showLoading(message: 'Đang đăng nhập...');

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        toast.closeAllLoading();
        return; // User hủy login
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCred = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );
      final firebaseUser = userCred.user!;
      final usersRef = FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid);

      final userDoc = await usersRef.get();

      late UserProfile userProfile;

      if (!userDoc.exists) {
        // Chưa có dữ liệu → tạo mới
        userProfile = UserProfile(
          uid: firebaseUser.uid,
          name: '',
          username: firebaseUser.displayName ?? '',
          email: firebaseUser.email ?? '',
          avatar: firebaseUser.photoURL ?? '',
          phone: '',
          gender: '',
          bio: '',
          website: '',
          postIds: const [],
          followerIds: const [],
          followingIds: const [],
          createdAt: DateTime.now(),
        );
        await usersRef.set(userProfile.toMap());
      } else {
        // Có dữ liệu → lấy dữ liệu thực từ Firestore
        userProfile = UserProfile.fromMap(userDoc.data()!, firebaseUser.uid);
      }

      // Cập nhật state provider
      ref.read(userProvider.notifier).setUser(userProfile);

      toast.closeAllLoading();
      toast.showToast(
        message: 'Đăng nhập thành công!',
        type: ToastType.success,
      );
    } catch (error) {
      toast.closeAllLoading();
      toast.showToast(
        message: 'Đăng nhập Google thất bại!',
        type: ToastType.error,
      );
      Logger().e('Sign in failed: $error');
    }
  }

  Future<void> signOut(LocalStorageService localStorage) async {
    await GoogleSignIn().signOut();
    await _auth.signOut();
    localStorage.clear();
  }

  User? get currentUser => _auth.currentUser;
}

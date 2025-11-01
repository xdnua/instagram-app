import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_app/base/dependency/app_service.dart';
import 'package:instagram_app/base/dependency/router/utils/route_input.dart';
import 'package:instagram_app/base/dependency/toast/toast_service.dart';
import 'package:instagram_app/constants/colors.dart';
import 'package:instagram_app/shared/providers/user_provider.dart';
import 'package:instagram_app/shared/services/auth_service.dart';
import 'package:instagram_app/shared/widgets/text/app_text_field.dart';

class AuthRegister extends ConsumerStatefulWidget {
  const AuthRegister({super.key});

  @override
  ConsumerState<AuthRegister> createState() => _AuthRegisterState();
}

class _AuthRegisterState extends ConsumerState<AuthRegister> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _loading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _onRegister() async {
    FocusScope.of(context).unfocus();
    final toast = ref.read(AppService.toast);
    final router = ref.read(AppService.router);
    final localStorage = ref.read(AppService.localStorage);

    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      toast.showToast(
        message: 'Vui lòng điền đầy đủ thông tin.',
        type: ToastType.warning,
      );
      return;
    }

    if (password != confirmPassword) {
      toast.showToast(
        message: 'Mật khẩu xác nhận không khớp.',
        type: ToastType.error,
      );
      return;
    }

    try {
      await AuthService().signOut(localStorage);
      setState(() => _loading = true);
      toast.showLoading();

      final user = await AuthService().registerWithEmail(
        email: email,
        password: password,
        username: email.split('@').first,
      );

      ref.read(userProvider.notifier).setUser(user);
      toast.closeAllLoading();
      toast.showToast(message: 'Đăng ký thành công!', type: ToastType.success);

      router.push(RouteInput.root());
    } on FirebaseAuthException catch (e) {
      toast.closeAllLoading();

      String msg = 'Đăng ký thất bại';
      if (e.code == 'email-already-in-use') msg = 'Email đã được sử dụng';
      if (e.code == 'weak-password') msg = 'Mật khẩu quá yếu (>=6 ký tự)';
      if (e.code == 'invalid-email') msg = 'Email không hợp lệ';

      toast.showToast(message: msg, type: ToastType.error);
    } catch (e) {
      toast.closeAllLoading();
      toast.showToast(
        message: 'Lỗi không xác định: ${e.toString()}',
        type: ToastType.error,
      );
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final localization = ref.watch(AppService.localization);

    return Column(
      children: [
        AppTextField(
          controller: _emailController,
          hintText: localization.email,
        ),
        const SizedBox(height: 12),
        AppTextField(
          controller: _passwordController,
          hintText: localization.password,
          obscureText: true,
        ),
        const SizedBox(height: 12),
        AppTextField(
          controller: _confirmPasswordController,
          hintText: localization.confirmPassword,
          obscureText: true,
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 44),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            foregroundColor: ColorConstants.backgroundWhite,
            backgroundColor: ColorConstants.verifiedBlue,
            shadowColor: Colors.black.withAlpha(128),
            elevation: 10,
          ),
          onPressed: _loading ? null : _onRegister,
          child:
              _loading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : Text(localization.signup),
        ),
      ],
    );
  }
}

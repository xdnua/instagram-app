import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_app/base/dependency/app_service.dart';
import 'package:instagram_app/base/dependency/router/utils/route_input.dart';
import 'package:instagram_app/base/dependency/toast/toast_service.dart';
import 'package:instagram_app/constants/colors.dart';
import 'package:instagram_app/feature/profile/models/user_profile.dart';
import 'package:instagram_app/shared/providers/user_provider.dart';
import 'package:instagram_app/shared/services/auth_service.dart';
import 'package:instagram_app/shared/widgets/text/app_text_field.dart';
import 'package:instagram_app/shared/widgets/text/app_text_style.dart';

class AuthLogin extends ConsumerStatefulWidget {
  const AuthLogin({super.key});

  @override
  ConsumerState<AuthLogin> createState() => _AuthLoginState();
}

class _AuthLoginState extends ConsumerState<AuthLogin> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _onLogin() async {
    FocusScope.of(context).unfocus();
    final toast = ref.read(AppService.toast);
    final router = ref.read(AppService.router);
    final localStorage = ref.read(AppService.localStorage);

    final email = _emailController.text.trim();
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      toast.showToast(
        message: 'Vui lòng nhập email và mật khẩu.',
        type: ToastType.warning,
      );
      return;
    }

    try {
      await AuthService().signOut(localStorage);
      toast.showLoading(message: 'Đang đăng nhập...');
      final user = await AuthService().loginWithEmail(
        email: email,
        password: password,
      );

      ref.read(userProvider.notifier).setUser(user.user as UserProfile);
      toast.closeAllLoading();
      toast.showToast(
        message: 'Đăng nhập thành công!',
        type: ToastType.success,
      );

      router.push(RouteInput.root());
    } catch (e) {
      toast.closeAllLoading();
      toast.showToast(
        message: 'Đăng nhập thất bại! Kiểm tra lại tài khoản.',
        type: ToastType.error,
      );
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
        const SizedBox(height: 19),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            localization.forgotPassword,
            style: AppTextStyle(
              color: ColorConstants.verifiedBlue,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
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
          onPressed: _onLogin,
          child: Text(localization.signin),
        ),
      ],
    );
  }
}

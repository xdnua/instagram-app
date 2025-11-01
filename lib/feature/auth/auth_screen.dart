import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_app/base/dependency/app_service.dart';
import 'package:instagram_app/base/dependency/router/utils/route_input.dart';
import 'package:instagram_app/base/dependency/toast/toast_service.dart';
import 'package:instagram_app/constants/colors.dart';
import 'package:instagram_app/constants/edge_insets.dart';
import 'package:instagram_app/feature/auth/widgets/auth_login.dart';
import 'package:instagram_app/feature/auth/widgets/auth_register.dart';
import 'package:instagram_app/shared/build/gen_l10n/app_localizations.dart';
import 'package:instagram_app/shared/build/gen/assets.gen.dart';
import 'package:instagram_app/shared/services/auth_service.dart';
import 'package:instagram_app/shared/widgets/divider/app_text_divider.dart';
import 'package:instagram_app/shared/widgets/text/app_text_style.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  bool isLoginScreen = true;

  Future<void> _loginWithGoogle() async {
    final toast = ref.read(AppService.toast);
    final router = ref.read(AppService.router);
    final localStorage = ref.read(AppService.localStorage);
    try {
      await AuthService().signOut(localStorage);
      toast.showLoading(message: 'Đang đăng nhập...');
      await AuthService().loginWithGoogle(ref);
      toast.closeAllLoading();
      toast.showToast(
        message: 'Đăng nhập thành công!',
        type: ToastType.success,
      );
      router.push(RouteInput.root());
    } catch (e) {
      toast.closeAllLoading();
      toast.showToast(message: 'Đăng nhập thất bại!', type: ToastType.error);
    }
  }

  Future<void> _loginWithFacebook() async {
    ToastService().showToast(
      message: 'Tính năng đăng nhập bằng Facebook đang được phát triển.',
      type: ToastType.info,
    );
  }

  void onSwitchAuthScreen() {
    setState(() {
      isLoginScreen = !isLoginScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    final localization = ref.watch(AppService.localization);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight:
                  MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom,
            ),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsConstants.horizontal16,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Assets.images.instagramLogo.image(
                            width: 130,
                            height: 51,
                          ),
                          const SizedBox(height: 39),
                          isLoginScreen
                              ? const AuthLogin()
                              : const AuthRegister(),
                          const SizedBox(height: 37),
                          _buildSocialAuthButton(
                            socialIcon: Assets.svgs.icGoogle.svg(
                              width: 17,
                              height: 17,
                            ),
                            text: localization.loginWithGoogle,
                            onPressed: _loginWithGoogle,
                          ),
                          _buildSocialAuthButton(
                            socialIcon: Assets.svgs.icFacebook.svg(
                              width: 17,
                              height: 17,
                            ),
                            text: localization.loginWithFacebook,
                            onPressed: _loginWithFacebook,
                          ),
                          const SizedBox(height: 41.5),
                          AppTextDivider(text: localization.or),
                          const SizedBox(height: 41.5),
                          _buildAuthSwitchText(localization),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.5),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      'Instagram от Facebook',
                      style: AppTextStyle(color: Color(0x66000000)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialAuthButton({
    required SvgPicture socialIcon,
    required String text,
    required VoidCallback onPressed,
  }) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: socialIcon,
      label: Text(
        text,
        style: AppTextStyle(
          color: ColorConstants.verifiedBlue,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildAuthSwitchText(AppLocalizations localization) {
    final promptText =
        isLoginScreen
            ? localization.dontHaveAccount
            : localization.alreadyHaveAccount;

    final actionText =
        isLoginScreen ? localization.signup : localization.signin;

    return RichText(
      text: TextSpan(
        text: promptText,
        style: AppTextStyle(color: ColorConstants.backgroundDark),
        children: [
          TextSpan(
            text: actionText,
            style: AppTextStyle(color: ColorConstants.verifiedBlue),
            recognizer: TapGestureRecognizer()..onTap = onSwitchAuthScreen,
          ),
        ],
      ),
    );
  }
}

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

enum ToastType { success, error, warning, info }

class ToastService {
  final NavigatorObserver observer = BotToastNavigatorObserver();

  ToastService();

  TransitionBuilder init() {
    return BotToastInit();
  }

  void showToast({
    required String message,
    ToastType type = ToastType.info,
    Duration duration = const Duration(seconds: 3),
  }) {
    Color bgColor;
    IconData icon;

    switch (type) {
      case ToastType.success:
        bgColor = Colors.green;
        icon = Icons.check_circle;
        break;
      case ToastType.error:
        bgColor = Colors.red;
        icon = Icons.error;
        break;
      case ToastType.warning:
        bgColor = Colors.orange;
        icon = Icons.warning;
        break;
      default:
        bgColor = Colors.blueGrey;
        icon = Icons.info;
    }

    BotToast.showCustomNotification(
      duration: duration,
      useSafeArea: true,
      toastBuilder:
          (cancelFunc) => _buildToastWidget(
            message: message,
            bgColor: bgColor,
            icon: icon,
            cancelFunc: cancelFunc,
          ),
    );
  }

  Widget _buildToastWidget({
    required String message,
    required Color bgColor,
    required IconData icon,
    required VoidCallback cancelFunc,
  }) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
            const SizedBox(width: 6),
            GestureDetector(
              onTap: cancelFunc,
              child: const Icon(Icons.close, color: Colors.white70, size: 18),
            ),
          ],
        ),
      ),
    );
  }

  void showText({String? message}) {
    BotToast.showText(text: message ?? 'Error');
  }

  void showLoading({String? message}) {
    BotToast.showLoading();
  }

  void closeAllLoading() {
    BotToast.closeAllLoading();
  }
}

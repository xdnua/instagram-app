import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

class ToastService {
  final NavigatorObserver observer = BotToastNavigatorObserver();

  ToastService();

  TransitionBuilder init() {
    return BotToastInit();
  }

  void showToastNotification({required ToastBuilder builder}) {
    BotToast.showCustomNotification(useSafeArea: true, toastBuilder: builder);
  }

  void showText({String? message}) {
    BotToast.showText(text: message ?? 'Error');
  }

  void showLoading({String? message}) {
    BotToast.showLoading();
  }
}

import 'package:flutter/material.dart';

class ColorConstants {
  // 🌈 Gradient chính của Instagram (Cam -> Hồng -> Tím)
  static const Color gradientStart = Color(0xFFFEDA75); // Vàng cam
  static const Color gradientMiddle1 = Color(0xFFFA7E1E); // Cam
  static const Color gradientMiddle2 = Color(0xFFD62976); // Hồng
  static const Color gradientEnd = Color(0xFF962FBF); // Tím
  static const Color gradientDeep = Color(0xFF4F5BD5); // Xanh tím

  // 🔹 Màu chủ đạo của Instagram
  static const Color primaryBlue = Color(0xFF405DE6); // Xanh Instagram
  static const Color secondaryPurple = Color(0xFF5851DB); // Tím đậm
  static const Color actionRed = Color(0xFFFF3040); // Màu tim (like)

  // 🖤 Màu chữ
  static const Color textPrimary = Color(0xFF262626); // Đen nhạt
  static const Color textSecondary = Color(0xFF8E8E8E); // Xám
  static const Color textHint = Color(0xFFC7C7C7); // Gợi ý nhập liệu

  // 🏳️ Màu nền và viền
  static const Color backgroundWhite = Color(0xFFFFFFFF); // Trắng
  static const Color backgroundDark = Color(0xFF000000); // Đen
  static const Color borderGray = Color(0xFFE0E0E0); // Viền xám
  static const Color cardBackground = Color(0xFFF5F5F5); // Nền card
  static const Color divider = Color(0xFFDADADA); // Đường kẻ chia

  // 🌟 Màu nhấn (Accent Colors)
  static const Color likeRed = Color(0xFFFF3040); // Màu đỏ của nút like
  static const Color verifiedBlue = Color(0xFF0095F6); // Xanh dương dấu tick
  static const Color followGreen = Color(0xFF2ECC71); // Xanh lá nút Follow

  // 🔲 Màu nền input & button
  static const Color inputBackground = Color(0xFFF3F4F6);
  static const Color buttonDisabled = Color(
    0xFFE0E0E0,
  ); // Màu nút bị vô hiệu hóa

  // 🔘 Màu radio & switch button
  static const Color radioActive = Color(0xFF4A90E2); // Xanh dương Instagram
  static const Color switchActive = Color(0xFF34C759); // Xanh lá

  // 🔳 Màu transparent (nền trong suốt)
  static const Color transparent = Colors.transparent;

  // 🎭 Màu của Story Ring (vòng viền story)
  static List<Color> storyRingGradient = [
    gradientStart,
    gradientMiddle1,
    gradientMiddle2,
    gradientEnd,
  ];
}

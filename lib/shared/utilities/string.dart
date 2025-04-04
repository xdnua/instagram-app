class StringUtils {
  static String? formatPhoneNumber(String? phone) {
    if (phone == null) {
      return null;
    }
    return '0$phone';
  }
}

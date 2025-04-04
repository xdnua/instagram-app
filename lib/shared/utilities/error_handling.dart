/// Handle error from async function in a more readable way
Future<(Object?, T?)> goAwaited<T>(Future<T> Function() function) async {
  try {
    final result = await function();

    return (null, result);
  } catch (e) {
    return (e, null);
  }
}

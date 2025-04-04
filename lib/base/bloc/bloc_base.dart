import 'package:riverpod/riverpod.dart';

abstract class BlocBase {
  bool isDisposed = false;

  void dispose() {
    isDisposed = true;
  }
}

AutoDisposeProvider<T> createAutoDisposeBloc<T extends BlocBase>(
  T Function(Ref ref) blocFunction,
) {
  return Provider.autoDispose<T>((ref) {
    final bloc = blocFunction(ref);
    ref.onDispose(() => bloc.dispose());
    return bloc;
  });
}

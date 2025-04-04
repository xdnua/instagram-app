import 'package:instagram_app/base/bloc/bloc_base.dart';
import 'package:instagram_app/shared/bloc/app_bloc.dart';

class BlocProvider {
  static final app = createAutoDisposeBloc((ref) => AppBloc(ref));

  BlocProvider._();
}

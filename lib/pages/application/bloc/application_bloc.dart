// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'application_event.dart';
part 'application_state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc() : super(const ApplicationState()) {
    on<TrigerApplicationEvent>(_trigerApplication);
  }
  void _trigerApplication(
      TrigerApplicationEvent event, Emitter<ApplicationState> emit) {
    emit(ApplicationState(index: event.index));
  }
}

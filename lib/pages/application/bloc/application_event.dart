part of 'application_bloc.dart';

@immutable
sealed class ApplicationEvent {
  const ApplicationEvent();
}

class TrigerApplicationEvent extends ApplicationEvent {
  final int index;
  const TrigerApplicationEvent(this.index) : super();
}

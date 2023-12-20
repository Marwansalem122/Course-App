part of 'welcome_bloc.dart';

@immutable
// ignore: must_be_immutable
 class WelcomeState {
  int page;
  WelcomeState({ required this.page});
}
// ignore: must_be_immutable
final class WelcomeInitial extends WelcomeState {
  WelcomeInitial():super(page: 0);
}

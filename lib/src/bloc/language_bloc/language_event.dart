part of 'language_bloc.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();
  @override
  List<Object> get props => [];
}

class InitializeLanguageEvent extends LanguageEvent {}

class ChangeLanguageEvent extends LanguageEvent {
  final Locale locale;
  final BuildContext context;
  const ChangeLanguageEvent(this.locale, this.context);
  @override
  List<Object> get props => [locale];
}

part of 'theme_bloc.dart';

sealed class ThemeEvent extends Equatable {
  const ThemeEvent();
}

final class BlocThemeInitEvent extends ThemeEvent {
  const BlocThemeInitEvent();

  @override
  List<Object> get props => [];
}

final class BlocThemeChangedEvent extends ThemeEvent {
  const BlocThemeChangedEvent(this.theme);
  final AppThemes theme;

  @override
  List<Object> get props => [theme];
}

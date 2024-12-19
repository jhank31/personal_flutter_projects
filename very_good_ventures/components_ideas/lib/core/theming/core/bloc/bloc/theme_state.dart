part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  const ThemeState({required this.currentTheme});
  final AppThemes currentTheme;
  ThemeData get theme => currentTheme.appTheme.theme;
  @override
  List<Object> get props => [
        currentTheme,
      ];
}

import 'package:components_ideas/core/constants/sizes.dart';
import 'package:components_ideas/core/theming/core/bloc/bloc/theme_bloc.dart';
import 'package:components_ideas/core/theming/theme/themes.dart';
import 'package:components_ideas/presentation/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeView extends StatelessWidget {
  const ThemeView({super.key});

  @override
  Widget build(BuildContext context) {
    final currentTheme = context.watch<ThemeBloc>().state.currentTheme;
    final theme = currentTheme.appTheme;
    return CustomScaffold(
      appBar: const CustomAppBar(
        title: 'Theme View',
        automaticallyImplyLeading: true,
        appBarColor: Colors.transparent,
      ),
      child: Center(
        child: Column(
          spacing: 30,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              onPressed: () {
                context.read<ThemeBloc>().add(
                      const BlocThemeChangedEvent(AppThemes.light),
                    );
              },
              iconSize: Sizes.p60,
              color: theme.isDark
                  ? theme.baseColorPalette.white.withValues(alpha: 200)
                  : theme.baseColorPalette.primaryColor,
              icon: const Icon(Icons.sunny),
            ),
            IconButton(
              onPressed: () {
                context.read<ThemeBloc>().add(
                      const BlocThemeChangedEvent(AppThemes.dark),
                    );
              },
              iconSize: Sizes.p60,
              color: theme.isDark
                  ? theme.baseColorPalette.primaryColor
                  : theme.baseColorPalette.black.withValues(alpha: 200),
              icon: const Icon(Icons.nightlight_round),
            ),
          ],
        ),
      ),
    );
  }
}

// floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           FloatingActionButton(
//             heroTag: 'light',
//             onPressed: () {
//               context.read<ThemeBloc>().add(
//                     const BlocThemeChangedEvent(AppThemes.light),
//                   );
//             },
//             child: const Icon(Icons.sunny),
//           ),
//           Gap.width20,
//           FloatingActionButton(
//             heroTag: 'dark',
//             onPressed: () {
//               context.read<ThemeBloc>().add(
//                     const BlocThemeChangedEvent(AppThemes.dark),
//                   );
//             },
//             child: const Icon(Icons.nightlight_round),
//           ),
//         ],
//       ),

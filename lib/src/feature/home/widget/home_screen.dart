import 'package:dayliees/src/core/constant/localization/localization.dart';
import 'package:dayliees/src/core/utils/layout/layout.dart';
import 'package:dayliees/src/feature/initialization/model/app_theme.dart';
import 'package:dayliees/src/feature/settings/bloc/app_settings_bloc.dart';
import 'package:dayliees/src/feature/settings/widget/settings_scope.dart';
import 'package:flutter/material.dart';

/// {@template home_screen}
/// HomeScreen is a simple screen that displays a grid of items.
/// {@endtemplate}
class HomeScreen extends StatelessWidget {
  /// {@macro home_screen}
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appSettings = SettingsScope.settingsOf(context);
    final windowSize = WindowSizeScope.of(context);

    // SettingsScope.of(context).add(
    //   AppSettingsEvent.updateAppSettings(
    //     appSettings: appSettings.copyWith(
    //       appTheme: AppTheme(
    //         themeMode: ThemeMode.system,
    //         seed: AppTheme.defaultTheme.seed,
    //       ),
    //     ),
    //   ),
    // );

    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
// SettingsScope.of(context).add(
//   AppSettingsEvent.updateAppSettings(
//     appSettings: appSettings.copyWith(
//       appTheme: AppTheme(
//         themeMode:
//             Theme.of(context).brightness == Brightness.light
//                 ? ThemeMode.dark
//                 : ThemeMode.light,
//         seed: AppTheme.defaultTheme.seed,
//       ),
//     ),
//   ),
// );

// SettingsScope.of(context).add(
// AppSettingsEvent.updateAppSettings(
// appSettings: appSettings.copyWith(
// locale: Localization.supportedLocales.last,
// ),
// ),
// );

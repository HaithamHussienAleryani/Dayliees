import 'package:dayliees/src/core/constant/localization/localization.dart';
import 'package:dayliees/src/core/utils/layout/layout.dart';
import 'package:dayliees/src/core/utils/refined_logger.dart';
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

    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    SettingsScope.of(context).add(
                      AppSettingsEvent.updateAppSettings(
                        appSettings: appSettings.copyWith(
                          appTheme: AppTheme(
                            themeMode:
                                Theme.of(context).brightness == Brightness.light
                                    ? ThemeMode.dark
                                    : ThemeMode.light,
                            seed: AppTheme.defaultTheme.seed,
                          ),
                        ),
                      ),
                    );
                  },
                  child: Text(Localization.of(context).custom_colors),
                ),
                Slider(
                  divisions: 8,
                  min: 0.5,
                  max: 2,
                  value: SettingsScope.settingsOf(context).textScale ?? 1,
                  onChanged: (value) {
                    SettingsScope.of(context).add(
                      AppSettingsEvent.updateAppSettings(
                        appSettings: appSettings.copyWith(textScale: value),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          SliverPadding(
            padding: HorizontalSpacing.centered(windowSize.width, 1600),
            sliver: SliverGrid.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                crossAxisCount: windowSize.maybeMap(
                  mediumFn: () => 2,
                  expandedFn: () => 3,
                  largeFn: () => 4,
                  extraLargeFn: () => 5,
                  orElse: () => 1,
                ),
              ),
              itemBuilder: (context, index) => ColoredBox(
                color: Theme.of(context).colorScheme.primary,
                child: Center(
                  child: Text(
                    'Item $index',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

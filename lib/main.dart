import 'dart:async';

import 'package:dayliees/src/core/utils/refined_logger.dart';
import 'package:dayliees/src/feature/initialization/logic/app_runner.dart';

void main() => runZonedGuarded(
      () => const AppRunner().initializeAndRun(),
      logger.logZoneError,
    );

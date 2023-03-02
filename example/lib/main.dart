import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:flutter/material.dart';

import 'app.dart';

Future<void> main() async {
  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://961d8d6aa9bc4078a0d319d616f5a6bc@o915401.ingest.sentry.io/4504724486094848';
      options.tracesSampleRate = 1.0;
    },
    appRunner: () => runApp(
      const App(),
    ),
  );
}

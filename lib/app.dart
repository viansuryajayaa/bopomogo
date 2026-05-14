import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'features/translation/presentation/screens/translation_screen.dart';

class BopomoGoApp extends StatelessWidget {
  const BopomoGoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BopomoGo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      home: const TranslationScreen(),
    );
  }
}

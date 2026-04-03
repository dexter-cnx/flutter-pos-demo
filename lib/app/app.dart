import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'scroll/app_scroll_behavior.dart';
import 'router/app_router.dart';
import 'theme/app_theme.dart';

class ThaiPosApp extends ConsumerWidget {
  const ThaiPosApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    return ScreenUtilInit(
      designSize: const Size(1280, 800), // Tablet Landscape
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Thai POS Demo',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.dark(),
          scrollBehavior: const AppScrollBehavior(),
          routerConfig: router,
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
        );
      },
    );
  }
}

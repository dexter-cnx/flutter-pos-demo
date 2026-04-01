import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('pos.title'.tr()),
        actions: [
          IconButton(
            icon: const Icon(Icons.translate),
            onPressed: () {
              if (context.locale.languageCode == 'th') {
                context.setLocale(const Locale('en'));
              } else {
                context.setLocale(const Locale('th'));
              }
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('app.title'.tr(), style: theme.textTheme.displayLarge),
            const SizedBox(height: 24),
            Text('dashboard.title'.tr(), style: theme.textTheme.headlineMedium),
            const SizedBox(height: 48),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  children: [
                    Text('login.title'.tr(), style: theme.textTheme.titleLarge),
                    const SizedBox(height: 16),
                    FilledButton(
                      onPressed: () {},
                      child: Text('common.pay'.tr()),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

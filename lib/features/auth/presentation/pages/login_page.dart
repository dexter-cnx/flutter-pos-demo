import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/l10n/localization.dart';
import '../../../../app/layout/responsive_layout.dart';
import '../providers/auth_provider.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  String _pin = '';

  void _onNumberTap(String number) {
    if (_pin.length < 4) {
      setState(() {
        _pin += number;
      });
    }

    if (_pin.length == 4) {
      ref.read(authNotifierProvider.notifier).login(_pin);
    }
  }

  void _onDelete() {
    if (_pin.isNotEmpty) {
      setState(() {
        _pin = _pin.substring(0, _pin.length - 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final authState = ref.watch(authNotifierProvider);

    ref.listen<AsyncValue<String?>>(authNotifierProvider, (previous, next) {
      next.whenData((role) {
        if (role != null) {
          context.go('/');
        }
      });
    });

    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final responsive = ResponsiveLayout.fromConstraints(constraints);
            final compact = responsive.isCompactForm;
            final maxWidth = constraints.maxWidth * (compact ? 0.42 : 0.3);
            final indicatorSize = compact ? 16.0 : 20.0;
            final indicatorGap = compact ? 8.0 : 12.0;
            final sectionGap = compact ? 28.0 : 48.0;
            final pinPadGap = compact ? 12.0 : 16.0;
            final pinPadRatio = compact ? 1.0 : 1.2;

            return Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: compact ? 8 : 24),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: maxWidth.clamp(320.0, 430.0),
                    minHeight: constraints.maxHeight - (compact ? 16 : 48),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children:
                              AppLocalization.supportedLocales.map((locale) {
                            final isSelected = context.locale.languageCode ==
                                locale.languageCode;
                            final label = locale.languageCode == 'th'
                                ? 'settings.language_th'.tr()
                                : 'settings.language_en'.tr();
                            return ChoiceChip(
                              label: Text(label),
                              selected: isSelected,
                              onSelected: (_) => context.setLocale(locale),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(height: compact ? 20 : 28),
                      Text(
                        'app.title'.tr(),
                        textAlign: TextAlign.center,
                        style: theme.textTheme.headlineMedium?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'login.subtitle'.tr(),
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primaryContainer.withValues(
                            alpha: 0.35,
                          ),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: theme.colorScheme.primary.withValues(
                              alpha: 0.25,
                            ),
                          ),
                        ),
                        child: Text(
                          'login.demo_hint'.tr(),
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurface,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: sectionGap),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(4, (index) {
                          final filled = index < _pin.length;
                          return Container(
                            margin:
                                EdgeInsets.symmetric(horizontal: indicatorGap),
                            width: indicatorSize,
                            height: indicatorSize,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: filled
                                  ? theme.colorScheme.primary
                                  : theme.colorScheme.surfaceContainerHigh,
                              boxShadow: filled
                                  ? [
                                      BoxShadow(
                                        color: theme.colorScheme.primary
                                            .withValues(alpha: 0.5),
                                        blurRadius: 10,
                                        spreadRadius: 2,
                                      ),
                                    ]
                                  : null,
                            ),
                          );
                        }),
                      ),
                      SizedBox(height: sectionGap),
                      if (authState.hasError)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Text(
                            authState.error.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(color: theme.colorScheme.error),
                          ),
                        ),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: pinPadGap,
                          crossAxisSpacing: pinPadGap,
                          childAspectRatio: pinPadRatio,
                        ),
                        itemCount: 12,
                        itemBuilder: (context, index) {
                          if (index == 9) return const SizedBox.shrink();
                          if (index == 10) return _buildPinButton('0');
                          if (index == 11) {
                            return _buildActionButton(
                              Icons.backspace_rounded,
                              _onDelete,
                              color: theme.colorScheme.surfaceContainerHigh,
                            );
                          }
                          return _buildPinButton('${index + 1}');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildPinButton(String number) {
    final theme = Theme.of(context);
    return Material(
      color: theme.colorScheme.surfaceContainerLow,
      borderRadius: BorderRadius.circular(24),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => _onNumberTap(number),
        child: Center(
          child: Text(
            number,
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, VoidCallback onTap, {Color? color}) {
    final theme = Theme.of(context);
    return Material(
      color: color ?? theme.colorScheme.surfaceContainerLow,
      borderRadius: BorderRadius.circular(24),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Center(child: Icon(icon, size: 32)),
      ),
    );
  }
}

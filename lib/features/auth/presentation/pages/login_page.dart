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
    final isLandscape =
        MediaQuery.orientationOf(context) == Orientation.landscape;

    ref.listen<AsyncValue<String?>>(authNotifierProvider, (previous, next) {
      next.whenData((role) {
        if (role == 'admin') {
          context.go('/menu-management');
        } else if (role == 'staff') {
          context.go('/');
        }
      });
    });

    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16),
        child: TextButton.icon(
          onPressed: () => _showAdminLogin(context, ref),
          icon: const Icon(Icons.admin_panel_settings_outlined),
          label: Text('login.admin_entry'.tr()),
          style: TextButton.styleFrom(
            foregroundColor: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final responsive = ResponsiveLayout.fromConstraints(constraints);
            final landscapeSplit = isLandscape && constraints.maxWidth >= 900;
            final compact = responsive.isCompactForm;
            final indicatorSize = compact ? 16.0 : 20.0;
            final indicatorGap = compact ? 8.0 : 12.0;
            final sectionGap = compact ? 24.0 : 40.0;
            final keypadMaxWidth = landscapeSplit ? 420.0 : 430.0;
            final panelWidth = constraints.maxWidth * 0.42;

            Widget buildLanguageSelector({required Alignment alignment}) {
              return Align(
                alignment: alignment,
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: AppLocalization.supportedLocales.map((locale) {
                    final isSelected =
                        context.locale.languageCode == locale.languageCode;
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
              );
            }

            Widget buildBrandBlock({required TextAlign textAlign}) {
              return Column(
                crossAxisAlignment: textAlign == TextAlign.left
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.center,
                children: [
                  Text(
                    'app.title'.tr(),
                    textAlign: textAlign,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'login.subtitle'.tr(),
                    textAlign: textAlign,
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
                      textAlign: textAlign,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              );
            }

            Widget buildPinIndicators() {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(4, (index) {
                      final filled = index < _pin.length;
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: indicatorGap),
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
                                    color: theme.colorScheme.primary.withValues(
                                      alpha: 0.5,
                                    ),
                                    blurRadius: 10,
                                    spreadRadius: 2,
                                  ),
                                ]
                              : null,
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'login.pin_hint'.tr(),
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: theme.hintColor.withValues(alpha: 0.6),
                    ),
                  ),
                ],
              );
            }

            Widget buildAuthError() {
              if (!authState.hasError) {
                return const SizedBox.shrink();
              }

              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  authState.error.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: theme.colorScheme.error),
                ),
              );
            }

            Widget buildLandscapeBadge(String label) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerLow.withValues(
                    alpha: 0.8,
                  ),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: theme.colorScheme.primary.withValues(alpha: 0.08),
                  ),
                ),
                child: Text(
                  label,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            }

            Widget buildLandscapeHero() {
              return Container(
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      theme.colorScheme.surface.withValues(alpha: 0.08),
                      theme.colorScheme.surfaceContainerLow.withValues(
                        alpha: 0.35,
                      ),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(
                    color: theme.colorScheme.primary.withValues(alpha: 0.08),
                  ),
                ),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildLanguageSelector(alignment: Alignment.centerLeft),
                        const SizedBox(height: 32),
                        Text(
                          'app.title'.tr(),
                          style: theme.textTheme.displayLarge?.copyWith(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.w800,
                            height: 1.0,
                          ),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: 460,
                          child: Text(
                            'login.subtitle'.tr(),
                            style: theme.textTheme.titleLarge?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                              height: 1.35,
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        buildLandscapeBadge('login.demo_hint'.tr()),
                        const SizedBox(height: 12),
                        buildLandscapeBadge('settings.offline_first'.tr()),
                        const SizedBox(height: 12),
                        buildLandscapeBadge('settings.storage_ready'.tr()),
                      ],
                    ),
                  ),
                ),
              );
            }

            Widget buildLoginPanel() {
              return Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerLow.withValues(
                    alpha: 0.55,
                  ),
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(
                    color: theme.colorScheme.primary.withValues(alpha: 0.08),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'login.title'.tr(),
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineMedium?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 20),
                    buildPinIndicators(),
                    const SizedBox(height: 12),
                    buildAuthError(),
                    const SizedBox(height: 8),
                    Expanded(
                      child: Center(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: keypadMaxWidth),
                          child: buildKeypad(landscape: true),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }

            if (landscapeSplit) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: buildLandscapeHero(),
                    ),
                  ),
                  SizedBox(
                    width: panelWidth.clamp(380.0, 520.0),
                    child: buildLoginPanel(),
                  ),
                ],
              );
            }

            final maxWidth = constraints.maxWidth * (compact ? 0.42 : 0.3);

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
                      buildLanguageSelector(alignment: Alignment.centerRight),
                      SizedBox(height: compact ? 20 : 28),
                      buildBrandBlock(textAlign: TextAlign.center),
                      SizedBox(height: sectionGap),
                      buildPinIndicators(),
                      SizedBox(height: sectionGap),
                      buildAuthError(),
                      buildKeypad(landscape: false),
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

  Widget buildKeypad({required bool landscape}) {
    final theme = Theme.of(context);
    return GridView.builder(
      shrinkWrap: !landscape,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: landscape ? 14 : 12,
        crossAxisSpacing: landscape ? 14 : 12,
        childAspectRatio: landscape ? 1.5 : 1.0,
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
        child: Semantics(
          button: true,
          label: number,
          child: Center(
            child: Text(
              number,
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
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
        child: Semantics(
          button: true,
          label: 'common.backspace'.tr(),
          child: Center(child: Icon(icon, size: 32)),
        ),
      ),
    );
  }

  void _showAdminLogin(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => const _AdminLoginDialog(),
    );
  }
}

class _AdminLoginDialog extends ConsumerStatefulWidget {
  const _AdminLoginDialog();

  @override
  ConsumerState<_AdminLoginDialog> createState() => _AdminLoginDialogState();
}

class _AdminLoginDialogState extends ConsumerState<_AdminLoginDialog> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('login.admin_entry'.tr()),
      scrollable: true,
      content: SizedBox(
        width: 400, // ดีสำหรับ Tablet/Desktop
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'login.admin_hint'.tr(),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'login.username'.tr(),
                prefixIcon: const Icon(Icons.person_outline),
              ),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                labelText: 'login.password'.tr(),
                prefixIcon: const Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                  onPressed: () =>
                      setState(() => _obscurePassword = !_obscurePassword),
                ),
              ),
              textInputAction: TextInputAction.done,
              onSubmitted: (_) {
                ref.read(authNotifierProvider.notifier).loginWithAdmin(
                      _usernameController.text,
                      _passwordController.text,
                    );
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('common.cancel'.tr()),
        ),
        FilledButton(
          onPressed: () {
            ref
                .read(authNotifierProvider.notifier)
                .loginWithAdmin(
                  _usernameController.text,
                  _passwordController.text,
                );
            Navigator.of(context).pop();
          },
          child: Text('login.sign_in'.tr()),
        ),
      ],
    );
  }
}

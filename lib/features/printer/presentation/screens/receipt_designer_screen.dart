import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/receipt_template_model.dart';
import '../providers/printer_providers.dart';

class ReceiptDesignerScreen extends ConsumerStatefulWidget {
  final int templateId;

  const ReceiptDesignerScreen({super.key, required this.templateId});

  @override
  ConsumerState<ReceiptDesignerScreen> createState() => _ReceiptDesignerScreenState();
}

class _ReceiptDesignerScreenState extends ConsumerState<ReceiptDesignerScreen> {
  ReceiptTemplateModel? _editingTemplate;

  @override
  void initState() {
    super.initState();
    // Pre-filling will be done in the build method when the provider data is available
  }

  void _onTemplateLoaded(ReceiptTemplateModel template) {
    _editingTemplate ??= ReceiptTemplateModel()
      ..id = template.id
      ..name = template.name
      ..type = template.type
      ..storeName = template.storeName
      ..storeAddress = template.storeAddress
      ..storePhone = template.storePhone
      ..taxId = template.taxId
      ..logoPath = template.logoPath
      ..showItemSku = template.showItemSku
      ..showTaxBreakdown = template.showTaxBreakdown
      ..showPaymentMethod = template.showPaymentMethod
      ..showCustomerInfo = template.showCustomerInfo
      ..showTableInfo = template.showTableInfo
      ..showQrCode = template.showQrCode
      ..footerText = template.footerText
      ..footerText2 = template.footerText2
      ..paperWidth = template.paperWidth
      ..fontFamily = template.fontFamily
      ..fontSize = template.fontSize
      ..isDefault = template.isDefault;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final asyncTemplate = ref.watch(receiptTemplateNotifierProvider(widget.templateId));

    return Scaffold(
      appBar: AppBar(
        title: Text('receipt.designer_title'.tr()),
        actions: [
          TextButton(
            onPressed: () => _save(context),
            child: Text('common.save'.tr(), style: TextStyle(color: theme.colorScheme.primary)),
          ),
        ],
      ),
      body: asyncTemplate.when(
        data: (template) {
          if (template == null) return const Center(child: Text('Template not found'));
          _onTemplateLoaded(template);
          
          return Row(
            children: [
              // Editor Panel
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeaderSection(theme),
                      const SizedBox(height: 32),
                      _buildContentOptions(theme),
                      const SizedBox(height: 32),
                      _buildFooterSection(theme),
                      const SizedBox(height: 32),
                      _buildPageSettings(theme),
                    ],
                  ),
                ),
              ),
              // Live Preview
              const VerticalDivider(width: 1),
              Expanded(
                flex: 1,
                child: Container(
                  color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                  child: Center(
                    child: _buildReceiptPreview(theme),
                  ),
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, st) => Center(child: Text('Error: $err')),
      ),
    );
  }

  Widget _buildHeaderSection(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('receipt.header_section'.tr(), style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        TextFormField(
          initialValue: _editingTemplate?.storeName,
          decoration: InputDecoration(labelText: 'settings.store_name'.tr(), prefixIcon: const Icon(Icons.store)),
          onChanged: (v) => setState(() => _editingTemplate?.storeName = v),
        ),
        const SizedBox(height: 12),
        TextFormField(
          initialValue: _editingTemplate?.storeAddress,
          decoration: InputDecoration(labelText: 'settings.store_address'.tr(), prefixIcon: const Icon(Icons.location_on)),
          onChanged: (v) => setState(() => _editingTemplate?.storeAddress = v),
          maxLines: 2,
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                initialValue: _editingTemplate?.storePhone,
                decoration: InputDecoration(labelText: 'settings.store_phone'.tr(), prefixIcon: const Icon(Icons.phone)),
                onChanged: (v) => setState(() => _editingTemplate?.storePhone = v),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextFormField(
                initialValue: _editingTemplate?.taxId,
                decoration: InputDecoration(labelText: 'settings.store_tax_id'.tr(), prefixIcon: const Icon(Icons.badge)),
                onChanged: (v) => setState(() => _editingTemplate?.taxId = v),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildContentOptions(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('receipt.content_section'.tr(), style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        SwitchListTile(
          title: Text('receipt.show_sku'.tr()),
          value: _editingTemplate?.showItemSku ?? false,
          onChanged: (v) => setState(() => _editingTemplate?.showItemSku = v),
        ),
        SwitchListTile(
          title: Text('receipt.show_tax'.tr()),
          value: _editingTemplate?.showTaxBreakdown ?? false,
          onChanged: (v) => setState(() => _editingTemplate?.showTaxBreakdown = v),
        ),
        SwitchListTile(
          title: Text('receipt.show_payment'.tr()),
          value: _editingTemplate?.showPaymentMethod ?? false,
          onChanged: (v) => setState(() => _editingTemplate?.showPaymentMethod = v),
        ),
        SwitchListTile(
          title: Text('receipt.show_customer'.tr()),
          value: _editingTemplate?.showCustomerInfo ?? false,
          onChanged: (v) => setState(() => _editingTemplate?.showCustomerInfo = v),
        ),
      ],
    );
  }

  Widget _buildFooterSection(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('receipt.footer_section'.tr(), style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        TextFormField(
          initialValue: _editingTemplate?.footerText,
          decoration: InputDecoration(labelText: 'receipt.footer_main'.tr()),
          onChanged: (v) => setState(() => _editingTemplate?.footerText = v),
        ),
        const SizedBox(height: 12),
        TextFormField(
          initialValue: _editingTemplate?.footerText2,
          decoration: InputDecoration(labelText: 'receipt.footer_sub'.tr()),
          onChanged: (v) => setState(() => _editingTemplate?.footerText2 = v),
        ),
      ],
    );
  }

  Widget _buildPageSettings(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('receipt.page_settings'.tr(), style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        DropdownButtonFormField<int>(
          initialValue: _editingTemplate?.paperWidth,
          decoration: InputDecoration(labelText: 'receipt.paper_width'.tr()),
          items: const [
            DropdownMenuItem(value: 58, child: Text('58mm')),
            DropdownMenuItem(value: 80, child: Text('80mm')),
          ],
          onChanged: (v) => setState(() => _editingTemplate?.paperWidth = v ?? 58),
        ),
      ],
    );
  }

  Widget _buildReceiptPreview(ThemeData theme) {
    final template = _editingTemplate;
    if (template == null) return const SizedBox.shrink();

    final width = template.paperWidth == 80 ? 320.0 : 240.0;

    return Container(
      width: width,
      margin: const EdgeInsets.symmetric(vertical: 32),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 10, spreadRadius: 2)],
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          // Header
          if (template.storeName != null) 
            Text(template.storeName!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black)),
          if (template.storeAddress != null)
            Text(template.storeAddress!, textAlign: TextAlign.center, style: const TextStyle(fontSize: 10, color: Colors.black)),
          if (template.storePhone != null)
            Text('Tel: ${template.storePhone}', style: const TextStyle(fontSize: 10, color: Colors.black)),
          if (template.taxId != null)
            Text('Tax ID: ${template.taxId}', style: const TextStyle(fontSize: 10, color: Colors.black)),
          
          const Divider(thickness: 1, color: Colors.black),
          
          // Items dummy
          _buildPreviewItem('ผัดไทย (Pad Thai)', '1', '฿85.00', template.showItemSku ? 'MAIN-001' : null),
          _buildPreviewItem('ชาไทย (Thai Tea)', '2', '฿90.00', template.showItemSku ? 'DRINK-001' : null),
          
          const Divider(thickness: 1, color: Colors.black),
          
          // Totals
          _buildPreviewRow('ยอดรวมสินค้า', '฿175.00'),
          if (template.showTaxBreakdown) 
            _buildPreviewRow('VAT 7%', '฿12.25'),
          _buildPreviewRow('ยอดรวมสุทธิ', '฿187.25', bold: true),
          
          if (template.showPaymentMethod) ...[
            const Divider(thickness: 0.5, color: Colors.black),
            _buildPreviewRow('ชำระโดย (Cash)', '฿200.00'),
            _buildPreviewRow('เงินทอน (Change)', '฿12.75'),
          ],
          
          const Divider(thickness: 1, color: Colors.black),
          
          // Footer
          if (template.footerText != null)
            Text(template.footerText!, style: const TextStyle(fontSize: 10, color: Colors.black)),
          if (template.footerText2 != null)
            Text(template.footerText2!, style: const TextStyle(fontSize: 10, color: Colors.black)),
          
          if (template.showQrCode) ...[
            const SizedBox(height: 12),
            Container(width: 60, height: 60, color: Colors.grey.shade300, child: const Icon(Icons.qr_code, color: Colors.black)),
          ],
        ],
      ),
    );
  }

  Widget _buildPreviewRow(String label, String value, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 10, fontWeight: bold ? FontWeight.bold : FontWeight.normal, color: Colors.black)),
          Text(value, style: TextStyle(fontSize: 10, fontWeight: bold ? FontWeight.bold : FontWeight.normal, color: Colors.black)),
        ],
      ),
    );
  }

  Widget _buildPreviewItem(String name, String qty, String price, String? sku) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (sku != null) Text(sku, style: const TextStyle(fontSize: 8, color: Colors.black54)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(name, style: const TextStyle(fontSize: 10, color: Colors.black))),
              Text('x$qty', style: const TextStyle(fontSize: 10, color: Colors.black)),
              const SizedBox(width: 12),
              Text(price, style: const TextStyle(fontSize: 10, color: Colors.black)),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _save(BuildContext context) async {
    if (_editingTemplate != null) {
      await ref.read(receiptTemplateNotifierProvider(widget.templateId).notifier).updateTemplate(_editingTemplate!);
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('menu.save_success'.tr())));
      Navigator.pop(context);
    }
  }
}

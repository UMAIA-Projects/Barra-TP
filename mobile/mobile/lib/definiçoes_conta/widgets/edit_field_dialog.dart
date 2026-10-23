import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class EditFieldDialog extends StatefulWidget {
  final String title;
  final String initialValue;
  final Function(String) onSave;

  const EditFieldDialog({
    Key? key,
    required this.title,
    required this.initialValue,
    required this.onSave,
  }) : super(key: key);

  @override
  State<EditFieldDialog> createState() => _EditFieldDialogState();
}

class _EditFieldDialogState extends State<EditFieldDialog> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return AlertDialog(
      title: Text(
        widget.title,
        style: TextStyle(
          fontFamily: 'DaysOne',
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      content: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: 'Digite novo valor',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppTheme.brandPrimary),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: AppTheme.brandPrimary,
              width: 2,
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            'Cancelar',
            style: TextStyle(color: AppTheme.brandPrimary),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            widget.onSave(_controller.text);
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.brandPrimary,
          ),
          child: const Text('Salvar'),
        ),
      ],
    );
  }
}

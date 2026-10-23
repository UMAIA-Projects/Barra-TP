import 'package:flutter/material.dart';
import 'package:desktop/constants/colors.dart';

class FilterCheckboxWidget extends StatelessWidget {
  final String label;
  final bool checked;
  final Function(bool) onChanged;

  const FilterCheckboxWidget({
    super.key,
    required this.label,
    required this.checked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          InkWell(
            onTap: () => onChanged(!checked),
            child: Container(
              width: 23,
              height: 23,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: AppColors.barraTeal),
              ),
              child: checked
                  ? Icon(
                      Icons.check,
                      size: 16,
                      color: AppColors.barraTeal,
                    )
                  : null,
            ),
          ),
          const SizedBox(width: 4),
          InkWell(
            onTap: () => onChanged(!checked),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.barraTeal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
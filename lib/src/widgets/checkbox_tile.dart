import 'package:flutter/material.dart';

import '../models/checkbox_item.dart';
import 'custom_checkbox.dart';

typedef CheckboxBuilder = Widget Function(
    bool value,
    ValueChanged<bool> onChanged,
    );

class CheckboxTile<T> extends StatelessWidget {
  const CheckboxTile({
    super.key,
    required this.item,
    required this.onChanged,
    this.checkboxBuilder,
    this.checkboxLeading = true,
    this.padding =
    const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 12,
    ),
    this.backgroundColor,
    this.borderRadius = 12,
  });

  final CheckboxItem<T> item;

  final ValueChanged<bool> onChanged;

  /// Custom checkbox widget.
  final CheckboxBuilder? checkboxBuilder;

  /// true = checkbox on left
  /// false = checkbox on right
  final bool checkboxLeading;

  final EdgeInsets padding;

  final Color? backgroundColor;

  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final checkbox = checkboxBuilder?.call(
      item.value,
      onChanged,
    ) ??
        CustomCheckbox(
          value: item.value,
          enabled: item.enabled,
          onChanged: onChanged,
        );

    return InkWell(
      borderRadius:
      BorderRadius.circular(borderRadius),
      onTap: item.enabled
          ? () => onChanged(!item.value)
          : null,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius:
          BorderRadius.circular(borderRadius),
        ),
        child: Row(
          children: [
            if (checkboxLeading) checkbox,

            if (checkboxLeading)
              const SizedBox(width: 12),

            if (item.icon != null)
              Icon(item.icon),

            if (item.icon != null)
              const SizedBox(width: 8),

            if (item.emoji != null)
              Text(
                item.emoji!,
                style: const TextStyle(
                  fontSize: 22,
                ),
              ),

            if (item.emoji != null)
              const SizedBox(width: 8),

            Expanded(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                  ),

                  if (item.subtitle != null)

                    Text(
                      item.subtitle!,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall,
                    ),
                ],
              ),
            ),

            if (!checkboxLeading)
              const SizedBox(width: 12),

            if (!checkboxLeading)
              checkbox,
          ],
        ),
      ),
    );
  }
}
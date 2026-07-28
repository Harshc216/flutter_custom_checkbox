import 'package:flutter/material.dart';

import 'custom_checkbox.dart';

typedef CheckboxFormFieldBuilder = Widget Function(
    bool value,
    ValueChanged<bool> onChanged,
    );

/// A FormField wrapper around CustomCheckbox.
class CheckboxFormField extends FormField<bool> {
  CheckboxFormField({
    super.key,
    bool initialValue = false,
    bool enabled = true,
    String? title,
    String? subtitle,
    Widget? secondary,
    EdgeInsetsGeometry padding =
    const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 12,
    ),
    FormFieldSetter<bool>? onSaved,
    FormFieldValidator<bool>? validator,
    ValueChanged<bool>? onChanged,
    AutovalidateMode autovalidateMode =
        AutovalidateMode.disabled,
    CheckboxFormFieldBuilder? checkboxBuilder,
  }) : super(
    initialValue: initialValue,
    enabled: enabled,
    onSaved: onSaved,
    validator: validator,
    autovalidateMode: autovalidateMode,
    builder: (state) {
      final checkbox = checkboxBuilder?.call(
        state.value ?? false,
            (value) {
          state.didChange(value);
          onChanged?.call(value);
        },
      ) ??
          CustomCheckbox(
            value: state.value ?? false,
            enabled: enabled,
            onChanged: (value) {
              state.didChange(value);
              onChanged?.call(value);
            },
          );

      return Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [

          InkWell(
            onTap: enabled
                ? () {
              final value =
              !(state.value ?? false);

              state.didChange(value);

              onChanged?.call(value);
            }
                : null,
            child: Padding(
              padding: padding,
              child: Row(
                children: [

                  checkbox,

                  const SizedBox(width: 12),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [

                        if (title != null)
                          Text(
                            title,
                            style: const TextStyle(
                              fontWeight:
                              FontWeight.w600,
                            ),
                          ),

                        if (subtitle != null)
                          Text(
                            subtitle,
                            style: Theme.of(
                              state.context,
                            )
                                .textTheme
                                .bodySmall,
                          ),

                      ],
                    ),
                  ),

                  if (secondary != null)
                    secondary,

                ],
              ),
            ),
          ),

          if (state.hasError)
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                top: 4,
              ),
              child: Text(
                state.errorText!,
                style: TextStyle(
                  color: Theme.of(
                    state.context,
                  ).colorScheme.error,
                  fontSize: 12,
                ),
              ),
            ),

        ],
      );
    },
  );
}
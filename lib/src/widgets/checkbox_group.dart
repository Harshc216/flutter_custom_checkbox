import 'package:flutter/material.dart';

import '../models/checkbox_item.dart';
import 'custom_checkbox.dart';

typedef CheckboxGroupItemBuilder<T> = Widget Function(
    BuildContext context,
    CheckboxItem<T> item,
    Widget checkbox,
    );

class CheckboxGroup<T> extends StatefulWidget {
  const CheckboxGroup({
    super.key,
    required this.items,
    required this.onChanged,
    this.multiSelection = true,
    this.showSelectAll = false,
    this.spacing = 12,
    this.runSpacing = 12,
    this.itemBuilder,
  });

  final List<CheckboxItem<T>> items;

  final ValueChanged<List<CheckboxItem<T>>> onChanged;

  final bool multiSelection;

  final bool showSelectAll;

  final double spacing;

  final double runSpacing;

  final CheckboxGroupItemBuilder<T>? itemBuilder;

  @override
  State<CheckboxGroup<T>> createState() =>
      _CheckboxGroupState<T>();
}

class _CheckboxGroupState<T>
    extends State<CheckboxGroup<T>> {

  late List<CheckboxItem<T>> _items;

  @override
  void initState() {
    super.initState();

    _items = List.of(widget.items);
  }

  void _toggleItem(
      int index,
      bool value,
      ) {

    setState(() {

      if (widget.multiSelection) {

        _items[index] =
            _items[index].copyWith(
              value: value,
            );

      } else {

        for (int i = 0; i < _items.length; i++) {

          _items[i] = _items[i].copyWith(
            value: i == index,
          );

        }

      }

    });

    _notify();
  }

  void _toggleAll(
      bool value,
      ) {

    setState(() {

      _items = _items.map((item) {

        if (!item.enabled) {
          return item;
        }

        return item.copyWith(
          value: value,
        );

      }).toList();

    });

    _notify();
  }

  void _notify() {

    widget.onChanged(
      _items.where(
            (item) => item.value,
      ).toList(),
    );

  }

  @override
  Widget build(BuildContext context) {

    final allSelected = _items
        .where((e) => e.enabled)
        .every((e) => e.value);

    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,
      children: [

        if (widget.showSelectAll)

          Row(
            children: [

              CustomCheckbox(
                value: allSelected,
                onChanged: _toggleAll,
              ),

              const SizedBox(width: 8),

              const Text("Select All"),

            ],
          ),

        Wrap(
          spacing: widget.spacing,
          runSpacing: widget.runSpacing,
          children: List.generate(
            _items.length,
                (index) {

              final item = _items[index];

              final checkbox = CustomCheckbox(
                value: item.value,
                enabled: item.enabled,
                onChanged: (value) {
                  _toggleItem(
                    index,
                    value,
                  );
                },
              );

              if (widget.itemBuilder != null) {

                return widget.itemBuilder!(
                  context,
                  item,
                  checkbox,
                );

              }

              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [

                  checkbox,

                  const SizedBox(width: 8),

                  if (item.icon != null)
                    Icon(
                      item.icon,
                      size: 18,
                    ),

                  if (item.icon != null)
                    const SizedBox(width: 6),

                  if (item.emoji != null)
                    Text(
                      item.emoji!,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),

                  if (item.emoji != null)
                    const SizedBox(width: 6),

                  Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [

                      Text(item.title),

                      if (item.subtitle != null)

                        Text(
                          item.subtitle!,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall,
                        ),

                    ],
                  ),

                ],
              );

            },
          ),
        ),

      ],
    );
  }
}
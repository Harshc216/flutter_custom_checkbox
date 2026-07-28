import 'package:flutter/material.dart';

import '../models/checkbox_item.dart';
import 'checkbox_tile.dart';

typedef CheckboxWrapItemBuilder<T> = Widget Function(
    BuildContext context,
    CheckboxItem<T> item,
    ValueChanged<bool> onChanged,
    );

class CheckboxWrap<T> extends StatefulWidget {
  const CheckboxWrap({
    super.key,
    required this.items,
    required this.onChanged,
    this.multiSelection = true,
    this.spacing = 12,
    this.runSpacing = 12,
    this.alignment = WrapAlignment.start,
    this.itemBuilder,
  });

  final List<CheckboxItem<T>> items;

  final ValueChanged<List<CheckboxItem<T>>> onChanged;

  final bool multiSelection;

  final double spacing;

  final double runSpacing;

  final WrapAlignment alignment;

  final CheckboxWrapItemBuilder<T>? itemBuilder;

  @override
  State<CheckboxWrap<T>> createState() =>
      _CheckboxWrapState<T>();
}

class _CheckboxWrapState<T>
    extends State<CheckboxWrap<T>> {

  late List<CheckboxItem<T>> _items;

  @override
  void initState() {
    super.initState();

    _items = List.of(widget.items);
  }

  void _toggle(
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

    widget.onChanged(
      _items
          .where((item) => item.value)
          .toList(),
    );

  }

  @override
  Widget build(BuildContext context) {

    return Wrap(

      spacing: widget.spacing,

      runSpacing: widget.runSpacing,

      alignment: widget.alignment,

      children: List.generate(
        _items.length,
            (index) {

          final item = _items[index];

          if (widget.itemBuilder != null) {

            return widget.itemBuilder!(
              context,
              item,
                  (value) {
                _toggle(index, value);
              },
            );

          }

          return SizedBox(
            width: 220,
            child: CheckboxTile<T>(
              item: item,
              onChanged: (value) {
                _toggle(index, value);
              },
            ),
          );

        },
      ),

    );

  }
}
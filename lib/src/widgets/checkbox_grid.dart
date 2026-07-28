import 'package:flutter/material.dart';

import '../models/checkbox_item.dart';
import 'checkbox_tile.dart';

typedef CheckboxGridBuilder<T> = Widget Function(
    BuildContext context,
    CheckboxItem<T> item,
    );

class CheckboxGrid<T> extends StatefulWidget {
  const CheckboxGrid({
    super.key,
    required this.items,
    required this.onChanged,
    this.crossAxisCount = 2,
    this.childAspectRatio = 3,
    this.mainAxisSpacing = 12,
    this.crossAxisSpacing = 12,
    this.multiSelection = true,
    this.itemBuilder,
    this.physics,
    this.shrinkWrap = true,
  });

  final List<CheckboxItem<T>> items;

  final ValueChanged<List<CheckboxItem<T>>> onChanged;

  final int crossAxisCount;

  final double childAspectRatio;

  final double mainAxisSpacing;

  final double crossAxisSpacing;

  final bool multiSelection;

  final CheckboxGridBuilder<T>? itemBuilder;

  final ScrollPhysics? physics;

  final bool shrinkWrap;

  @override
  State<CheckboxGrid<T>> createState() =>
      _CheckboxGridState<T>();
}

class _CheckboxGridState<T>
    extends State<CheckboxGrid<T>> {

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
      _items.where(
            (e) => e.value,
      ).toList(),
    );

  }

  @override
  Widget build(BuildContext context) {

    return GridView.builder(

      shrinkWrap: widget.shrinkWrap,

      physics: widget.physics,

      itemCount: _items.length,

      gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(

        crossAxisCount:
        widget.crossAxisCount,

        childAspectRatio:
        widget.childAspectRatio,

        mainAxisSpacing:
        widget.mainAxisSpacing,

        crossAxisSpacing:
        widget.crossAxisSpacing,
      ),

      itemBuilder: (_, index) {

        final item = _items[index];

        if (widget.itemBuilder != null) {

          return widget.itemBuilder!(
            context,
            item,
          );

        }

        return CheckboxTile<T>(
          item: item,
          onChanged: (value) {
            _toggle(index, value);
          },
        );

      },

    );

  }
}
import 'package:flutter/material.dart';

/// Model representing a single checkbox item.
class CheckboxItem<T> {
  /// Creates a checkbox item.
  const CheckboxItem({
    required this.title,
    required this.data,
    this.subtitle,
    this.value = false,
    this.enabled = true,
    this.icon,
    this.emoji,
  });

  /// Main title.
  final String title;

  /// Optional subtitle.
  final String? subtitle;

  /// Actual object/value represented by this item.
  ///
  /// Examples:
  /// String
  /// int
  /// enum
  /// User model
  final T data;

  /// Checked state.
  final bool value;

  /// Whether this item is enabled.
  final bool enabled;

  /// Optional icon.
  final IconData? icon;

  /// Optional emoji.
  final String? emoji;

  /// Returns a copy with updated values.
  CheckboxItem<T> copyWith({
    String? title,
    String? subtitle,
    T? data,
    bool? value,
    bool? enabled,
    IconData? icon,
    String? emoji,
  }) {
    return CheckboxItem<T>(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      data: data ?? this.data,
      value: value ?? this.value,
      enabled: enabled ?? this.enabled,
      icon: icon ?? this.icon,
      emoji: emoji ?? this.emoji,
    );
  }
}
import 'package:flutter/foundation.dart';

/// Controller for managing checkbox state.
class CheckboxController extends ChangeNotifier {
  /// Creates a checkbox controller.
  CheckboxController({
    bool initialValue = false,
  }) : _value = initialValue;

  bool _value;

  /// Current checkbox value.
  bool get value => _value;

  /// Whether the checkbox is checked.
  bool get isChecked => _value;

  /// Whether the checkbox is unchecked.
  bool get isUnchecked => !_value;

  /// Updates the checkbox value.
  void setValue(bool newValue) {
    if (_value == newValue) return;

    _value = newValue;
    notifyListeners();
  }

  /// Toggles the checkbox.
  void toggle() {
    _value = !_value;
    notifyListeners();
  }

  /// Checks the checkbox.
  void check() {
    if (_value) return;

    _value = true;
    notifyListeners();
  }

  /// Unchecks the checkbox.
  void uncheck() {
    if (!_value) return;

    _value = false;
    notifyListeners();
  }

  /// Resets the checkbox.
  void reset() {
    _value = false;
    notifyListeners();
  }
}
import 'package:flutter/material.dart';

class DropdownProvider with ChangeNotifier {
  final Map<String, String> _selectedValues = {}; // Stores selected values
  final Map<String, List<String>> _dropdownItems = {}; // Stores items list

  /// Get the selected value for a dropdown
  String getSelectedValue(String key) {
    if (!_selectedValues.containsKey(key) ||
        !_dropdownItems[key]!.contains(_selectedValues[key])) {
      _selectedValues[key] =
          _dropdownItems[key]?.first ?? "Select"; // Default to first item
    }
    return _selectedValues[key]!;
  }

  /// Update the selected value
  void updateValue(String key, String newValue) {
    if (_selectedValues[key] != newValue) {
      _selectedValues[key] = newValue;
      notifyListeners();
    }
  }

  /// Set dropdown items list for a given dropdown key
  void setDropdownItems(String key, List<String> items) {
    _dropdownItems[key] = ["Select", ...items]; // Always add "Select" first
    if (!_selectedValues.containsKey(key) ||
        !_dropdownItems[key]!.contains(_selectedValues[key])) {
      _selectedValues[key] = _dropdownItems[key]!.first;
    }
    notifyListeners();
  }

  /// Get dropdown items safely
  List<String> getDropdownItems(String key) {
    return _dropdownItems[key] ?? ["Select"];
  }
}

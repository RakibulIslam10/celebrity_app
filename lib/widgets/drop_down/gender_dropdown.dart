import 'package:celebrity/core/utils/dimensions.dart';
import 'package:celebrity/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth/dropdown_controller.dart';

class CustomGenderDropdown extends StatelessWidget {
  final String dropdownKey;
  final List<String> items;
  final String hint;

  const CustomGenderDropdown({
    Key? key,
    required this.dropdownKey,
    required this.items,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dropdownProvider = Provider.of<DropdownProvider>(context);

    // Default value with "Select"
    String selectedValue = dropdownProvider.getSelectedValue(dropdownKey);
    bool isDefault = selectedValue == "Select";

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 24),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: DropdownButton<String>(
              value: isDefault
                  ? null
                  : selectedValue, // Show "Select" if not chosen
              isExpanded: true,
              underline: const SizedBox(),
              icon: const Icon(Icons.arrow_drop_down),
              hint: Text(
                hint,
                style: AppTextStyles.subtitle,
              ), // Default hint text
              items: [
                const DropdownMenuItem<String>(
                  value: "Select",
                  child: Text("Select"),
                ),
                ...items.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: AppTextStyles.title.copyWith(
                        fontSize: Dimensions.fontSizeMedium,
                      ),
                    ),
                  );
                }).toList(),
              ],
              onChanged: (String? newValue) {
                if (newValue != null && newValue != "Select") {
                  dropdownProvider.updateValue(dropdownKey, newValue);
                }
              },
            ),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}

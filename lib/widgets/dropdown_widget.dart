import 'package:celebrity/core/utils/dimensions.dart';
import 'package:celebrity/core/utils/sized.dart';
import 'package:celebrity/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth/dropdown_controller.dart';

class CustomDropdown extends StatelessWidget {
  final String label;
  final String dropdownKey;
  final List<String> items;

  const CustomDropdown({
    Key? key,
    required this.label,
    required this.dropdownKey,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dropdownProvider =
        Provider.of<DropdownProvider>(context, listen: false);

    // Ensure items are initialized in the provider
    WidgetsBinding.instance.addPostFrameCallback((_) {
      dropdownProvider.setDropdownItems(dropdownKey, items);
    });

    return Consumer<DropdownProvider>(
      builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppTextStyles.title,
              ),
              verticalSpace(Dimensions.heightSize * 0.6),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.horizontalSpacingLarge),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(Dimensions.radius),
                ),
                child: DropdownButton<String>(
                  value: provider.getSelectedValue(dropdownKey),
                  isExpanded: true,
                  underline: const SizedBox(),
                  icon: const Icon(Icons.arrow_drop_down),
                  items: provider
                      .getDropdownItems(dropdownKey)
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: AppTextStyles.title
                            .copyWith(fontSize: Dimensions.fontSizeMedium),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      provider.updateValue(dropdownKey, newValue);
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

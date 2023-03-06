import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';

class FilterDropDownWidget extends StatefulWidget {
  final List<String> data;
  final Function(String dropdownButtonValue) getValue;

  const FilterDropDownWidget({
    Key? key,
    required this.getValue,
    required this.data,
  }) : super(key: key);

  @override
  State<FilterDropDownWidget> createState() => _FilterDropDownWidgetState();
}

class _FilterDropDownWidgetState extends State<FilterDropDownWidget> {
  late String dropdownButtonValue;

  @override
  void initState() {
    super.initState();
    dropdownButtonValue = 'Please select';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Sizes.dimen_12),
      decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(Sizes.dimen_16),
          border: Border.all(
            color: AppColor.grey,
          )),

      /// Dropdown
      child: DropdownButton<String>(
        onChanged: (String? newValue) {
          if (newValue != null && newValue != dropdownButtonValue) {
            widget.getValue(newValue);
            dropdownButtonValue = newValue;
            setState(() {});
          }
        },
        borderRadius: BorderRadius.circular(Sizes.dimen_16),
        hint: Text(
          dropdownButtonValue,
          style: AppTextStyle.regular16,
        ),
        dropdownColor: AppColor.white,
        isExpanded: false,
        elevation: 3,
        style: AppTextStyle.regular14,
        isDense: true,
        underline: const SizedBox.shrink(),
        icon: const Icon(
          Icons.keyboard_arrow_down,
          size: Sizes.dimen_24,
          color: AppColor.red,
        ),
        items: widget.data.map<DropdownMenuItem<String>>((value) {
          return DropdownMenuItem<String>(
            value: value,
            onTap: () {},
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:personal_financial_management/app/components/colors/my_colors.dart';
import 'package:personal_financial_management/app/components/icons/my_icons.dart';

typedef void ParentCallback(Object val);

class CateGoriesSeletor extends StatefulWidget {
  CateGoriesSeletor({
    Key? key,
    required this.categories,
    this.parentCallback,
    this.parentKey = 'none',
    this.selectorType = 'none',
    this.itemId = '',
  }) : super(key: key);
  final Map<String, Widget> categories;
  final String itemId;
  final String parentKey;
  final String selectorType;
  ParentCallback? parentCallback;
  @override
  State<CateGoriesSeletor> createState() => _CateGoriesSeletorState();
}

class _CateGoriesSeletorState extends State<CateGoriesSeletor> {
  late String defaultDropdownValue = 'Chọn danh mục';

  late final dropdownKey;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    dropdownKey = GlobalKey();
    if (widget.categories.isNotEmpty)
      defaultDropdownValue = widget.categories.keys.first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
            color: MyAppColors.gray600, style: BorderStyle.solid, width: 0.80),
      ),
      child: widget.categories.isEmpty
          ? DropdownButtonHideUnderline(
              child: Padding(
                padding: const EdgeInsets.only(right: 6.0),
                child: DropdownButton(
                  onChanged: null,
                  isExpanded: true,
                  items: [
                    DropdownMenuItem(
                      child: Container(
                          margin: const EdgeInsets.only(left: 82),
                          child:
                              const Text('Không có danh mục nào để hiện thị')),
                    ),
                  ],
                ),
              ),
            )
          : DropdownButtonHideUnderline(
              child: ButtonTheme(
                alignedDropdown: true,
                padding: EdgeInsets.zero,
                child: DropdownButton<String>(
                  value: defaultDropdownValue,
                  key: dropdownKey,
                  icon: MyAppIcons.arrowDropDown,
                  elevation: 16,
                  isExpanded: true,
                  alignment: Alignment.center,
                  underline: null,
                  style: const TextStyle(color: Colors.deepPurple),
                  onChanged: (newValue) {
                    setState(() {
                      defaultDropdownValue = newValue!;
                    });
                  },
                  items: widget.categories.keys
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: RadioListTile(
                        groupValue: defaultDropdownValue,
                        selected: defaultDropdownValue == value,
                        controlAffinity: ListTileControlAffinity.trailing,
                        value: value,
                        secondary: widget.categories[value],
                        title: Text(
                          value,
                          textAlign: TextAlign.start,
                        ),
                        onChanged: (newValue) {
                          if (widget.parentCallback != null) {
                            widget.parentCallback!({
                              'parentKey': widget.parentKey,
                              'value': newValue,
                              'selectorType': widget.selectorType,
                            });
                          }
                          setState(() {
                            defaultDropdownValue = newValue.toString();
                            Navigator.pop(dropdownKey.currentContext!);
                          });
                        },
                      ),
                    );
                  }).toList(),
                  selectedItemBuilder: (context) {
                    return widget.categories.keys.map((String value) {
                      return ListTile(
                        title: Text(value),
                        leading: widget.categories[value],
                      );
                    }).toList();
                  },
                ),
              ),
            ),
    );
  }
}

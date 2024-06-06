import 'package:e_klinik_pens/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProfilesField extends StatefulWidget {
  final double width;
  final double height;
  final String placeholder;
  final IconData? suffixIcon;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final IconData? trailingIcon;
  final bool readOnly;
  final List<String>? dropdownItems;
  final ValueChanged<String?>? onChangedDropdown;

  const CustomProfilesField({
    Key? key,
    required this.width,
    required this.height,
    required this.placeholder,
    this.suffixIcon,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.trailingIcon,
    this.readOnly = false,
    this.dropdownItems,
    this.onChangedDropdown,
  }) : super(key: key);

  @override
  State<CustomProfilesField> createState() => _CustomProfilesFieldState();
}

class _CustomProfilesFieldState extends State<CustomProfilesField> {
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        widget.controller.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0).w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: widget.width,
            height: widget.height,
            padding: const EdgeInsets.symmetric(horizontal: 20.0).w,
            decoration: BoxDecoration(
              color: fill,
              border: Border.all(color: stroke),
              borderRadius: BorderRadius.circular(24.0).w,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: widget.controller,
                    decoration: InputDecoration(
                      hintText: widget.placeholder,
                      hintStyle: TextStyle(
                        fontFamily: 'Inter-Regular',
                        fontSize: 16.sp,
                        color: onBoard,
                      ),
                      border: InputBorder.none,
                    ),
                    enableInteractiveSelection: !widget.readOnly,
                    keyboardType: widget.keyboardType,
                    inputFormatters: widget.inputFormatters,
                    readOnly: widget.readOnly,
                  ),
                ),
                if (widget.trailingIcon != null)
                  if (widget.dropdownItems != null)
                    DropdownButton<String>(
                      icon: Icon(widget.trailingIcon),
                      underline: SizedBox(),
                      items: widget.dropdownItems!
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          widget.controller.text = newValue ?? "";
                          if (widget.onChangedDropdown != null) {
                            widget.onChangedDropdown!(newValue);
                          }
                        });
                      },
                    )
                  else
                    IconButton(
                      icon: Icon(widget.trailingIcon),
                      onPressed: () {
                        _selectDate(context);
                      },
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

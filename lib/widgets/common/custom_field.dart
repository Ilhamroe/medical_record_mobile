import 'package:e_klinik_pens/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CustomFormField extends StatelessWidget {
//   final double width;
//   final double height;
//   final String placeholder;
//   final String leadingIcon;
//   final String? Function(String?) validator;
//   final TextEditingController controller;

//   CustomFormField({
//     required this.width,
//     required this.height,
//     required this.placeholder,
//     required this.leadingIcon,
//     required this.validator,
//     required this.controller,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 5.0).w,
//       child: Container(
//         width: width,
//         height: height,
//         padding: const EdgeInsets.symmetric(horizontal: 20.0).w,
//         decoration: BoxDecoration(
//           color: fill,
//           border: Border.all(color: stroke),
//           borderRadius: BorderRadius.circular(24.0).w,
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextFormField(
//               controller: controller,
//               decoration: InputDecoration(
//                 icon: Image.asset(leadingIcon),
//                 hintText: placeholder,
//                 hintStyle: TextStyle(
//                     fontFamily: 'Inter-Regular', fontSize: 16.sp, color: onBoard),
//                 border: InputBorder.none,
//               ),
//               validator: validator,
//               autovalidateMode: AutovalidateMode.onUserInteraction,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class CustomFormField extends StatefulWidget {
  final double width;
  final double height;
  final String placeholder;
  final String leadingIcon;
  final IconData? trailingIcon;
  final Widget? trailing;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;

  CustomFormField({
    required this.width,
    required this.height,
    required this.placeholder,
    required this.leadingIcon,
    this.trailingIcon,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.inputFormatters,
    this.trailing,
  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  late bool _obscureText;
  bool _isFieldNotEmpty = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
    widget.controller.addListener(_updateFieldState);
  }

  void _updateFieldState() {
    setState(() {
      _isFieldNotEmpty = widget.controller.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    widget.controller.removeListener(_updateFieldState);
    super.dispose();
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0).w,
      child: Container(
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
                obscureText: _obscureText,
                decoration: InputDecoration(
                  icon: Image.asset(
                    widget.leadingIcon,
                    color: _isFieldNotEmpty
                        ? themeDark
                        : null, // Change color based on field state
                  ),
                  hintText: widget.placeholder,
                  hintStyle: TextStyle(
                      fontFamily: 'Inter-Regular',
                      fontSize: 16.sp,
                      color: onBoard),
                  border: InputBorder.none,
                ),
                keyboardType: widget.keyboardType,
                inputFormatters: widget.inputFormatters,
              ),
            ),
            if (widget.trailing != null) widget.trailing!,
            if (widget.trailingIcon != null)
              IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: onBoard,
                ),
                onPressed: _toggleObscureText,
              ),
          ],
        ),
      ),
    );
  }
}

import 'package:e_klinik_pens/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final int maxLines;
  final String label;
  final String text;
  final bool blurText;
  final ValueChanged<String> onChanged;

  const CustomTextField({
    super.key,
    this.maxLines = 1,
    required this.label,
    required this.text,
    required this.blurText,
    required this.onChanged, 
    });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();

    controller= TextEditingController(
      text: widget.text
    );
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.045
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.015,
        ),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(12)
            ),
            filled: true,
            fillColor: fieldColor,
          ),
          maxLines: widget.maxLines,
          textAlign: TextAlign.left,
          obscureText: widget.blurText,
        )
      ],
    );
  }
}






class CustomEmailWidget extends StatefulWidget {
  final int maxLines;
  final String label;
  final String text;
  final ValueChanged<String> onChanged;

  const CustomEmailWidget({
    super.key,
    this.maxLines = 1,
    required this.label,
    required this.text,
    required this.onChanged,
    });

  @override
  State<CustomEmailWidget> createState() => _CustomEmailWidgetState();
}

class _CustomEmailWidgetState extends State<CustomEmailWidget> {

  late final TextEditingController controller;
  final _formKey= GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    controller= TextEditingController(
      text: widget.text
    );
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.045
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.015,
        ),
        Form(
          key: _formKey,
          child: TextFormField(
            controller: controller,
            keyboardType: TextInputType.emailAddress,
            maxLines: widget.maxLines,
            textAlign: TextAlign.left,  
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12)
              ),
              filled: true,
              fillColor: fieldColor,
              hintText: AutofillHints.email
            ),
            validator: (value){
              if( value == null || value.isEmpty){
                return "Email tidak boleh kosong";
              }
              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
              return 'Masukkan email yang valid';
              }
              return null;
            },
          ),
        )
      ],
    );
  }
}




class CustomNumberField extends StatefulWidget {
  final int maxLines;
  final String label;
  final String text;
  final TextAlign textAlign; 
  final List<TextInputFormatter> inputFormat;
  final ValueChanged<String> onChanged;

  const CustomNumberField({
    super.key,
    this.maxLines = 1,
    required this.label,
    required this.text,
    required this.textAlign, 
    required this.inputFormat,
    required this.onChanged,
    });

  @override
  State<CustomNumberField> createState() => _CustomNumberFieldState();
}

class _CustomNumberFieldState extends State<CustomNumberField> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();

    controller= TextEditingController(
      text: widget.text
    );
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
        return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.045
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.015,
        ),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(12)
            ),
            filled: true,
            fillColor: fieldColor,
            counterText: "",
          ),
          maxLines: widget.maxLines,
          textAlign: widget.textAlign,
          textAlignVertical: TextAlignVertical.center,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: widget.inputFormat,
        )
      ],
    );
  }
}
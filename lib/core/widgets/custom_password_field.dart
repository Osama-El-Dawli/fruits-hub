import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({super.key, this.onSaved});
  final void Function(String?)? onSaved;

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      isObsecured: obscureText,
      onSaved: widget.onSaved,
      hintText: 'كلمة المرور',
      textInputType: TextInputType.visiblePassword,
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        icon: Icon(
          obscureText ? Icons.visibility : Icons.visibility_off,
          color: Color(0xffC9CECF),
        ),
      ),
    );
  }
}

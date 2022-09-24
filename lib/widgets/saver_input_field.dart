import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saver/constants.dart';

class SaverInputField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final TextInputAction? textInputAction;
  final String? hintText;
  final String? prefixIcon;
  final TextInputType? keyboardType;
  final int? maxLength;
  final bool obscureText;
  final String errorText;

  const SaverInputField({
    Key? key,
    this.textEditingController,
    this.textInputAction,
    this.hintText,
    this.prefixIcon,
    this.keyboardType,
    this.maxLength,
    this.obscureText = false,
    this.errorText = 'must have at least 3 characters',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: textEditingController,
        textInputAction: textInputAction,
        maxLength: maxLength,
        autofocus: false,
        keyboardType: keyboardType,
        obscureText: obscureText,
        onFieldSubmitted: (value) {},
        onChanged: (value) {
          // TODO refactor this valdition to get a new keybordType
          if (textEditingController != null &&
              textEditingController!.text.startsWith('0') &&
              keyboardType == TextInputType.number) {
            textEditingController!.text = '';
          }
        },
        validator: (value) {
          if (value == null) return 'this field is required';
          return value.length < 3 ? errorText : null;
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          hintText: hintText,
          counterText: '',
          prefixIcon: prefixIcon != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: defaultPadding * 0.75),
                  child: SvgPicture.asset(prefixIcon!,
                      height: 24,
                      width: 24,
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .color!
                          .withOpacity(0.3)),
                )
              : null,
        ));
  }
}

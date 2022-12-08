import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gradient_borders/gradient_borders.dart';

import '../resources/meteor_theme.dart';

class MeteorTextField extends StatelessWidget {
  const MeteorTextField({
    Key? key,
    this.initialValue,
    this.keyboardType,
    this.inputFormatters,
    this.controller,
    this.enabled,
    this.minLines,
    this.maxLength,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.maxLines,
    this.readOnly = false,
    this.obscureText = false,
    this.obscuringCharacter = '•',
    this.hintText,
    this.padding = const EdgeInsets.symmetric(horizontal: 32.0),
  }) : super(key: key);

  final String? initialValue;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final bool readOnly;
  final bool? enabled;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final bool obscureText;
  final String obscuringCharacter;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final String? hintText;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final MeteorTheme theme = Theme.of(context).extension<MeteorTheme>()!;

    double borderWidth = 2.0;
    double focusedBorderWidth = 4.0;
    double disabledBorderWidth = 1.0;
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(8.0));
    EdgeInsets contentPadding = const EdgeInsets.all(16.0);

    return Padding(
      padding: padding,
      child: TextFormField(
        initialValue: initialValue,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        controller: controller,
        readOnly: readOnly,
        enabled: enabled,
        minLines: minLines,
        maxLines: maxLines,
        maxLength: maxLength,
        obscureText: obscureText,
        obscuringCharacter: obscuringCharacter,
        onChanged: onChanged,
        onSaved: onSaved,
        validator: validator,
        style: theme.textStyle,
        cursorColor: theme.textStyle?.color,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: theme.textStyle?.copyWith(
            color: theme.outline,
          ),
          filled: true,
          fillColor: theme.containerBackground,
          hoverColor: theme.containerBackground,
          contentPadding: contentPadding,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: theme.outline!,
              width: borderWidth,
            ),
            borderRadius: borderRadius,
          ),
          focusedBorder: GradientOutlineInputBorder(
            gradient: theme.primaryGradient!,
            width: focusedBorderWidth,
            borderRadius: borderRadius,
          ),
          errorBorder: GradientOutlineInputBorder(
            gradient: theme.errorGradient!,
            width: borderWidth,
            borderRadius: borderRadius,
          ),
          focusedErrorBorder: GradientOutlineInputBorder(
            gradient: theme.errorGradient!,
            width: focusedBorderWidth,
            borderRadius: borderRadius,
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: theme.outline!,
              width: disabledBorderWidth,
            ),
            borderRadius: borderRadius,
          ),
        ),
      ),
    );
  }
}

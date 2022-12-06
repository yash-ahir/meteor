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
        style: MeteorTheme.of(context)!.textStyle,
        cursorColor: MeteorTheme.of(context)!.textStyle.color,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: MeteorTheme.of(context)!.textStyle.copyWith(
                color: MeteorTheme.of(context)!.outline,
              ),
          filled: true,
          fillColor: MeteorTheme.of(context)!.containerBackground,
          hoverColor: MeteorTheme.of(context)!.containerBackground,
          contentPadding: contentPadding,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: MeteorTheme.of(context)!.outline,
              width: borderWidth,
            ),
            borderRadius: borderRadius,
          ),
          focusedBorder: GradientOutlineInputBorder(
            gradient: MeteorTheme.of(context)!.primaryGradient,
            width: focusedBorderWidth,
            borderRadius: borderRadius,
          ),
          errorBorder: GradientOutlineInputBorder(
            gradient: MeteorTheme.of(context)!.errorGradient,
            width: borderWidth,
            borderRadius: borderRadius,
          ),
          focusedErrorBorder: GradientOutlineInputBorder(
            gradient: MeteorTheme.of(context)!.errorGradient,
            width: focusedBorderWidth,
            borderRadius: borderRadius,
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: MeteorTheme.of(context)!.outline,
              width: disabledBorderWidth,
            ),
            borderRadius: borderRadius,
          ),
        ),
      ),
    );
  }
}

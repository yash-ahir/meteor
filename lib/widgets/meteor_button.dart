import 'package:flutter/material.dart';

import '../resources/meteor_theme.dart';

class MeteorButton extends StatefulWidget {
  const MeteorButton({
    Key? key,
    this.text,
    this.icon,
    required this.onPressed,
    this.onLongPressed,
    this.gradient = false,
  }) : super(key: key);

  final String? text;
  final IconData? icon;
  final bool gradient;
  final void Function() onPressed;
  final void Function()? onLongPressed;

  @override
  State<MeteorButton> createState() => _MeteorButtonState();
}

class _MeteorButtonState extends State<MeteorButton> {
  @override
  Widget build(BuildContext context) {
    final MeteorTheme theme = Theme.of(context).extension<MeteorTheme>()!;

    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(8.0));

    EdgeInsets contentPadding = EdgeInsets.symmetric(
      vertical:
          (widget.icon == null ? 8.0 : 6.0) + (widget.gradient ? 2.0 : 0.0),
      horizontal:
          (widget.text == null ? 10.0 : 16.0) + (widget.gradient ? 2.0 : 0.0),
    );

    if (widget.text == null && widget.icon == null) {
      throw AssertionError(
        "Either the text parameter or the icon parameter must be set.",
      );
    }

    return Ink(
      decoration: widget.gradient
          ? BoxDecoration(
              gradient: theme.primaryGradient!,
              borderRadius: borderRadius,
            )
          : BoxDecoration(
              color: theme.containerBackground!,
              border: Border.all(
                width: 2.0,
                color: theme.outline!,
              ),
              borderRadius: borderRadius,
            ),
      child: InkWell(
        focusColor: theme.outline?.withOpacity(widget.gradient ? 0.5 : 0.3),
        hoverColor: theme.outline?.withOpacity(widget.gradient ? 0.4 : 0.2),
        splashColor: theme.outline?.withOpacity(0.1),
        mouseCursor: SystemMouseCursors.click,
        enableFeedback: true,
        borderRadius: borderRadius,
        onTap: widget.onPressed,
        onLongPress: widget.onLongPressed,
        canRequestFocus: true,
        child: Container(
          padding: contentPadding,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              widget.text != null
                  ? Row(
                      children: [
                        Text(
                          widget.text!,
                          style: TextStyle(
                            color: widget.gradient
                                ? theme.scaffoldBackground!
                                : theme.textStyle!.color!,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        widget.icon != null
                            ? const SizedBox(width: 2.0)
                            : Container(),
                      ],
                    )
                  : Container(),
              widget.icon != null
                  ? Icon(
                      widget.icon,
                      color: widget.gradient
                          ? theme.scaffoldBackground!
                          : theme.textStyle!.color!,
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}

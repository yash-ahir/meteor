import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final bool value;
  final void Function(bool state) onChanged;

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  late bool _switchState;
  bool _holdingState = false;

  @override
  void initState() {
    super.initState();
    _switchState = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _switchState = !_switchState;
              widget.onChanged(_switchState);
            });

            HapticFeedback.mediumImpact();
          },
          onTapDown: (details) {
            setState(() {
              _holdingState = true;
            });

            HapticFeedback.lightImpact();
          },
          onTapUp: (details) {
            setState(() {
              _holdingState = false;
            });
          },
          onTapCancel: () {
            setState(() {
              _holdingState = false;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: _switchState
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.outline,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(32.0),
              color: _switchState
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.surfaceVariant,
            ),
            height: 32.0,
            width: 52.0,
            child: AnimatedAlign(
              alignment:
                  _switchState ? Alignment.centerRight : Alignment.centerLeft,
              duration: const Duration(milliseconds: 250),
              curve: Curves.decelerate,
              child: AnimatedContainer(
                curve: Curves.fastLinearToSlowEaseIn,
                duration: const Duration(milliseconds: 500),
                margin: EdgeInsets.symmetric(
                  vertical: _holdingState ? 0.0 : (_switchState ? 3.5 : 4.5),
                ),
                height: 28.0,
                width: 28.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _switchState
                      ? (_holdingState
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.primaryContainer)
                      : (_holdingState
                          ? Theme.of(context).colorScheme.onSurfaceVariant
                          : Theme.of(context).colorScheme.outline),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

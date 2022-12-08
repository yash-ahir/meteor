import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meteor/resources/meteor_theme.dart';

class MeteorSwitch extends StatefulWidget {
  const MeteorSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final bool value;
  final void Function(bool state) onChanged;

  @override
  State<MeteorSwitch> createState() => _MeteorSwitchState();
}

class _MeteorSwitchState extends State<MeteorSwitch> {
  late bool _switchState;
  bool _holdingState = false;

  @override
  void initState() {
    super.initState();
    _switchState = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    final MeteorTheme theme = Theme.of(context).extension<MeteorTheme>()!;

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _switchState = !_switchState;
              widget.onChanged(_switchState);
            });
          },
          onTapDown: (details) {
            setState(() {
              _holdingState = true;
            });

            HapticFeedback.mediumImpact();
          },
          onTapUp: (details) {
            setState(() {
              _holdingState = false;
            });

            HapticFeedback.lightImpact();
          },
          onTapCancel: () {
            setState(() {
              _holdingState = false;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: _switchState ? theme.primaryGradient : null,
              border: Border.all(
                color: theme.outline!,
                width: _switchState ? double.minPositive : 2.0,
              ),
              borderRadius: BorderRadius.circular(32.0),
              color: theme.containerBackground,
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
                height: _switchState ? 32.0 : 28.0,
                width: _switchState ? 32.0 : 28.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      _switchState ? theme.containerBackground : theme.outline,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

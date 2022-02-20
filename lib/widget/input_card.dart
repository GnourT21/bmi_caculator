import 'package:flutter/material.dart';

class InputCard extends StatelessWidget {
  const InputCard(
      {Key? key,
      required this.child,
      required this.voidCallBack,
      required this.widgetColor})
      : super(key: key);
  final Widget child;
  final Function()? voidCallBack;
  final Color widgetColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: voidCallBack,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: widgetColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: child,
      ),
    );
  }
}

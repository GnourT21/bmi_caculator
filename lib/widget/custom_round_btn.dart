import 'package:flutter/material.dart';

class MyRoundedButton extends StatelessWidget {
  const MyRoundedButton(
      {Key? key,
      required this.width,
      required this.icon,
      this.onpress,
      required this.shape,
      required this.height})
      : super(key: key);

  final double width;
  final double height;
  final Function()? onpress;
  final ShapeBorder shape;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onpress,
      fillColor: Colors.white30,
      elevation: 0,
      shape: shape,
      constraints: BoxConstraints(minHeight: height, minWidth: width),
      child: Icon(icon),
    );
  }
}

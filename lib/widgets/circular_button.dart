import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_app/core/app_theme.dart';

class CircularButton extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final String text;
  final Color textColor;
  final EdgeInsets padding;
  final SvgPicture? icon;
  final Function() onClicked;

  const CircularButton(
      {Key? key,
      required this.height,
      required this.width,
      required this.color,
      required this.text,
      required this.textColor,
      required this.padding,
      this.icon,
      required this.onClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onClicked,
      child: Container(
        height: height,
        width: width,
        padding: padding,
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
        child: Center(child: Text(text,style: AppTheme.darkTheme.textTheme.labelLarge),),
      ),
    );
  }
}

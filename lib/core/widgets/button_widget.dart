import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final double height;
  final double? width;
  final double? radius;
  final Widget? widget;
  final String? title;
  final void Function() onTap;
  final Color? borderColor;
  final bool titleBold = false;
  final Color? bgColor;
  final Color? textColor;
  const ButtonWidget(
      {super.key,
      required this.height,
      this.width,
      this.radius,
      this.widget,
      this.title,
      required this.onTap,
      this.borderColor,
      this.bgColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 12.0),
          border: Border.all(color: borderColor ?? Colors.transparent),
          color: bgColor ?? Theme.of(context).primaryColor,
        ),
        child: title == null
            ? widget
            : Text(
                title ?? "",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: textColor,
                    fontWeight: titleBold ? FontWeight.w600 : null),
                textAlign: TextAlign.center,
              ),
      ),
    );
  }
}

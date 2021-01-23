import 'package:flutter/material.dart';

import 'ColorHelper.dart';

class AbcAvatar extends StatelessWidget {
  String title;
  bool isRectangle;

  TitleConfiguration titleConfiguration;
  RectangeConfiguration rectangeConfiguration;
  CircleConfiguration circleConfiguration;

  Map<String, Color> backgroundColors;

  AbcAvatar(this.title, {this.isRectangle, this.backgroundColors, this.titleConfiguration, this.circleConfiguration, this.rectangeConfiguration}) {
    if (title == null) throw Exception("Title cannot be empty");

    backgroundColors = backgroundColors ?? ColorHelper().getDefaultBackColor();
  }

  @override
  Widget build(BuildContext context) {
    var content = Text(title.substring(0, 1).toUpperCase(),
        style: TextStyle(color: titleConfiguration?.color ?? Colors.white, fontSize: titleConfiguration?.size ?? 17, fontWeight: titleConfiguration?.fontWeight ?? FontWeight.normal));

    return (isRectangle ?? false)
        ? Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: getBackgroundColor(title),
          borderRadius: BorderRadius.all(Radius.circular(rectangeConfiguration?.borderRadius ?? 0)),
          boxShadow: [BoxShadow(color: rectangeConfiguration?.shadowColor ?? Colors.black, offset: Offset(0, 0), blurRadius: rectangeConfiguration?.blurRadius ?? 0)]),
      width: rectangeConfiguration?.width ?? 100,
      height: rectangeConfiguration?.height ?? 100,
      child: Center(child: content),
    )
        : CircleAvatar(
      radius: circleConfiguration?.radius ?? 20,
      backgroundColor: getBackgroundColor(title),
      child: content,
    );
  }

  Color getBackgroundColor(String title) {
    var firstLetter = title.substring(0, 1).toUpperCase();

    return backgroundColors[firstLetter];
  }
}

class TitleConfiguration {
  TitleConfiguration({this.size, this.color, this.fontWeight});

  FontWeight fontWeight;
  Color color;
  double size;
}

class CircleConfiguration {
  CircleConfiguration({this.radius});

  double radius;
}

class RectangeConfiguration {
  RectangeConfiguration({this.borderRadius, this.width, this.height, this.shadowColor,this.blurRadius});

  Color shadowColor;

  double borderRadius;
  double width;
  double height;
  double blurRadius;
}

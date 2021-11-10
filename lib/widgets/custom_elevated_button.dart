import 'package:flutter/material.dart';
import 'package:kurs_sabak9/screens/login_screen.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key key,
    this.backgroundColor,
    this.pressedColor,
    this.hoveredColor,
    this.buttonText,
    this.screenRouteId,
    this.horizontal,
    this.vertical,
  }) : super(key: key);

  final Color backgroundColor;
  final Color pressedColor;
  final Color hoveredColor;
  final String buttonText;
  final String screenRouteId;
  final double horizontal;
  final double vertical;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(12.0),
        backgroundColor:
            MaterialStateProperty.all<Color>(backgroundColor ?? Colors.blue),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
            // side: BorderSide(color: Colors.red),
          ),
        ),
        overlayColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return pressedColor ?? Colors.grey[400];
            } else if (states.contains(MaterialState.hovered)) {
              return hoveredColor ?? Colors.grey[200];
            }
            return null; // Defer to the widget's default.
          },
        ),
      ),
      onPressed: () {
        Navigator.pushNamed(context, screenRouteId);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: horizontal ?? 120.0, vertical: vertical ?? 18.0),
        child: Text(
          buttonText ?? 'Login',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final ButtonStyle style;
  final String title;
  final Function onPressed;

  const CustomButton({
    Key key,
    @required this.style,
    @required this.title,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: this.style,
      onPressed: this.onPressed,
      child: Container(
        width: double.infinity,
        height: 55,
        child: Center(
          child: Text(
            this.title,
            style: TextStyle(fontSize: 17),
          ),
        ),
      ),
    );
  }
}

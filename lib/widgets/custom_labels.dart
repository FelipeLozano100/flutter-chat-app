import 'package:flutter/material.dart';

class CustomLabels extends StatelessWidget {
  final String ruta;
  final String title;
  final String pregunta;

  const CustomLabels({
    Key key,
    @required this.ruta,
    @required this.title,
    @required this.pregunta
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Text(this.pregunta,
            style: TextStyle(
                color: Colors.black54,
                fontSize: 15,
                fontWeight: FontWeight.w300)),
        SizedBox(height: 10),
        GestureDetector(
          child: Text(this.title,
              style: TextStyle(
                  color: Colors.blue[600],
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          onTap: () {
            Navigator.pushReplacementNamed(context, this.ruta);
          },
        )
      ],
    ));
  }
}

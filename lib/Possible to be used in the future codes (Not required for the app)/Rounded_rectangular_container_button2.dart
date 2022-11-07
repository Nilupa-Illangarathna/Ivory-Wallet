import 'package:flutter/material.dart';


class ElevatedGradientButton extends StatelessWidget {
  const ElevatedGradientButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFFE6197), Color(0xFFFFB463)],
          // colors: [Color(0xFF6448FE), Color(0xFF5FC6FF)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.all(Radius.circular(14.0)),
      ),
      child: ElevatedButton(
        onPressed: (){},
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),
        ),
        child: Text("Click"),
      ),
    );
  }
}

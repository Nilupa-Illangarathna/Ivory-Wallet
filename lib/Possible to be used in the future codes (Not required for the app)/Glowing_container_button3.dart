import 'package:flutter/material.dart';






class GlowingButton extends StatelessWidget {
  const GlowingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width*0.9,
          height: MediaQuery.of(context).size.height*0.25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                blurRadius: 40,
                offset: Offset(0, 15),
                color: Color(0xff45BAFB), ////////////////////////////////////////////////////color
              )
            ],
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff31DFB5),////////////////////////////////////////////////////color
                Color(0xff45BAFB),////////////////////////////////////////////////////color
              ],
            ),
          ),
          // decoration: BoxDecoration(
          //   gradient: LinearGradient(
          //     colors: [Color(0xFFFE6197), Color(0xFFFFB463)],
          //     // colors: [Color(0xFF6448FE), Color(0xFF5FC6FF)],
          //     begin: Alignment.centerLeft,
          //     end: Alignment.centerRight,
          //   ),
          //   borderRadius: BorderRadius.all(Radius.circular(14.0)),
          // ),
          child: ElevatedButton(
            onPressed: (){},
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),
            ),
            child: Text("Click"),
          ),
        ),
      ],
    );
  }
}

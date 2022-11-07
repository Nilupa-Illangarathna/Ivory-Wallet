import 'package:flutter/material.dart';

buildTextTitleVariation1(String text){
  return Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: Text(
      text,
      style: TextStyle(
        fontFamily: "amasis-mt-std-black",
        fontSize: 36,
        fontWeight: FontWeight.w100,
        color: Colors.black,
      ),
    ),
  );
}

buildTextTitleVariation2(String text, bool opacity){
  return Padding(
    padding: EdgeInsets.only(bottom: 16),
    child: Text(
      text,
      style: TextStyle(
        fontFamily: 'arlrdbd',
        fontSize: 24,
        fontWeight: FontWeight.w300,
        color: opacity ? Colors.grey[400] : Colors.black,
      ),
    ),
  );
}

buildTextSubTitleVariation1(String text){
  return Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: Text(
      text,
      style: TextStyle(
        fontFamily: 'arlrdbd',
        // fontFamily: GoogleFonts.montserratTextTheme(),
        fontSize: 16,
        fontWeight: FontWeight.w300,
        color: Colors.grey[400],
      ),
    ),
  );
}

buildTextSubTitleVariation2(String text){
  return Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontFamily: 'arlrdbd',
        fontSize: 16,
        fontWeight: FontWeight.w300,
        color: Colors.grey[400],
      ),
    ),
  );
}

buildRecipeTitle(String text){
  return Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontFamily: 'arlrdbd',
        fontSize: 22,
        fontWeight: FontWeight.w300,
        // fontWeight: FontWeight.bold,
      ),
    ),
  );
}

buildRecipeSubTitle(String text){
  return Padding(
    padding: EdgeInsets.only(bottom: 16),
    child: Text(
      text,
      style: TextStyle(
        fontFamily: 'arlrdbd',
        fontSize: 16,
        fontWeight: FontWeight.w300,
        color: Colors.grey[400],
      ),
    ),
  );
}

buildCalories(String text){
  return Text(
    text,
    style: TextStyle(
      fontFamily: 'arlrdbd',
      fontSize: 16,
      color: Colors.black,
      // fontWeight: FontWeight.bold,
      fontWeight: FontWeight.w300,
    ),
  );
}
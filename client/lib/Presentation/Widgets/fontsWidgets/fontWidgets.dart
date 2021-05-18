import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class ApplicationBarsFonts extends StatelessWidget {
  const ApplicationBarsFonts({
    Key key, this.barTitle, this.fontSize, this.fontWeight,
  }) : super(key: key);
  final String barTitle;
  final double fontSize;
  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      barTitle,
      style: GoogleFonts.ptSerif(
        color: Colors.white,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
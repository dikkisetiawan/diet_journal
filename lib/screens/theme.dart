import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//main Color
Color kPrimaryColor = const Color(0xFF2d41b3); //0xff56DCC5
Color kSecondaryColor = const Color(0xFFeb6a90); //0xFF171A1F
Color kOrangeColor = const Color(0xffe98547);
Color kBlueColor = const Color(0xff566CDC);
Color kGreenColor = const Color(0xff8BD97B);
Color kPinkColor = const Color(0xffEB819C);

//Secondary Color
Color kDangerColor = const Color(0xffF27D81);
Color kWarningColor = const Color(0xffF6CE7E);
Color kSuccessColor = const Color(0xffC3ED6E);
Color kInfoColor = const Color(0xff60B2F0);

//Gray Color Set
Color kBackgroundColor = const Color(0xFFf2f3f8); //0xFF000000
Color kGreyColor = const Color(0xFF9095A1);
Color kWhiteColor = const Color(0xFFFFFFFF);
Color kBlackColor = Color.fromARGB(255, 34, 34, 34);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semibold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;

TextStyle blackTextStyle =
    GoogleFonts.manrope(color: kBlackColor, fontWeight: bold);

TextStyle whiteTextStyle =
    GoogleFonts.manrope(color: kWhiteColor, fontSize: 14, fontWeight: bold);

TextStyle greyTextStyle =
    GoogleFonts.manrope(color: kGreyColor, fontSize: 18, fontWeight: bold);

TextStyle buttonTextStyle =
    GoogleFonts.manrope(color: kBlueColor, fontSize: 14, fontWeight: bold);

//Circular Value
const defaultCircular = 15.0;
const defaultTopLeftCircular = 100.0;
const defaultMargin = 30.0;

//shadow Value
BoxShadow kShadow = BoxShadow(
    blurRadius: 20.0,
    color: Colors.black.withOpacity(0.2),
    spreadRadius: 5.0,
    offset: Offset(5, 10));

const kBorderRadius = BorderRadius.only(
    bottomLeft: Radius.circular(10.0),
    topLeft: Radius.circular(10.0),
    bottomRight: Radius.circular(10.0),
    topRight: Radius.circular(100.0));

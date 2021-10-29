import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// COLORS
const kBackgroundColor = Color(0xFF0C0D21);
const kLightBackgroundColor = Color(0xFF14152A);
const kBlue = Color(0xFF2E4DC1);
const kLightGrey = Color(0xFFF6F6F6);
const kTextColor = Color(0xFFFFFFFF);
const kGreen = Color(0xFF28CC85);

// TEXT-STYLES
TextStyle kTitleTextStyle = GoogleFonts.poppins(
    color: kTextColor, fontSize: 28, fontWeight: FontWeight.bold);

TextStyle kRegularTextStyle =
    GoogleFonts.poppins(color: kTextColor, fontSize: 14);

TextStyle kAppBarTextStyle =
    kRegularTextStyle.copyWith(fontSize: 18, fontWeight: FontWeight.w600);

TextStyle kButtonTextStyle = GoogleFonts.poppins(
    color: kTextColor, fontSize: 16, fontWeight: FontWeight.bold);

// PADDING
const kMainPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 8);

// DECORATIONS
const kRoundedTopBorder = BorderRadius.vertical(top: Radius.circular(24));
const kBorderRadius = BorderRadius.all(Radius.circular(16));

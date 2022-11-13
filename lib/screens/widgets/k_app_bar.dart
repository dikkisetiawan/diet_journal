import 'dart:ui';

import 'package:flutter/material.dart';
import '/screens/theme.dart';

class kAppBar {
  AppBar myAppBar(String title) {
    return AppBar(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(defaultCircular),
        ),
      ),
      elevation: 0.0,
      // systemOverlayStyle: SystemUiOverlayStyle(
      //     systemStatusBarContrastEnforced: true,
      //     statusBarBrightness: Brightness.dark,
      //     statusBarIconBrightness: Brightness.dark,
      //     statusBarColor: kBackgroundColor), //status bar color
      backgroundColor: kBackgroundColor,
      title: Text(
        title,
        style: blackTextStyle.copyWith(fontWeight: black),
      ),
      centerTitle: false,
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: kGreyColor,
            )),
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.calendar_month),
            color: kGreyColor),
        Center(
          child: Text(
            '15 May',
            style: greyTextStyle,
          ),
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_forward, color: kGreyColor)),
      ],
    );
  }
}

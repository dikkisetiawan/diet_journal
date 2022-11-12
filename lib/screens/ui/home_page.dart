import 'dart:ui';

import '/screens/theme.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

AppBar myAppBar() {
  return AppBar(
    elevation: 0.0,
    backgroundColor: kBackgroundColor,
    title: Text(
      'My Diary',
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
          onPressed: () {}, icon: Icon(Icons.arrow_forward, color: kGreyColor)),
    ],
  );
}

//title header separator
Widget titleDivider(String title, String buttonTitle) {
  return Container(
    margin: const EdgeInsets.only(
        bottom: 20, left: defaultMargin, right: defaultMargin),
    child: Row(
      children: [
        Text(
          title,
          style: greyTextStyle,
        ),
        const Spacer(),
        TextButton(
            onPressed: () {},
            child: Text(
              buttonTitle,
              style: buttonTextStyle,
            )),
        const Icon(Icons.arrow_forward)
      ],
    ),
  );
}

Widget statContainer() {
  return Container(
    margin: const EdgeInsets.only(
        bottom: defaultMargin, left: defaultMargin, right: defaultMargin),
    padding: const EdgeInsets.all(defaultMargin),
    decoration: BoxDecoration(
        boxShadow: [kShadow], color: Colors.white, borderRadius: kBorderRadius),
    child: Column(
      children: [
        Row(
          children: [
            Column(
              children: [eatenWidget(), eatenWidget()],
            ),
            const Spacer(),
            circularIndicator()
          ],
        ),
        Divider(
          height: 50.0,
          color: kGreyColor.withOpacity(0.5),
          thickness: 1.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            indicatorWidget('Carbs', 12, kPrimaryColor),
            indicatorWidget('Protein', 30, kSecondaryColor),
            indicatorWidget('Fat', 10, kOrangeColor)
          ],
        )
      ],
    ),
  );
}

Widget circularIndicator() {
  return CircularPercentIndicator(
    arcType: ArcType.FULL,
    arcBackgroundColor: kPrimaryColor.withOpacity(0.1),
    radius: 60.0,
    lineWidth: 13.0,
    animation: true,
    percent: 0.7,
    center: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "1503",
          style: buttonTextStyle.copyWith(fontWeight: extraBold),
        ),
        Text(
          "Kcal left",
          style: greyTextStyle.copyWith(fontSize: 14),
        )
      ],
    ),
    circularStrokeCap: CircularStrokeCap.round,
    linearGradient: LinearGradient(
      colors: [
        kPrimaryColor,
        kPrimaryColor.withOpacity(0.5),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  );
}

Widget indicatorWidget(String title, int number, Color mainColor) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: blackTextStyle.copyWith(fontSize: 18.0),
      ),
      SizedBox(
        height: 10.0,
      ),
      LinearPercentIndicator(
        padding: EdgeInsets.all(0.0),
        alignment: MainAxisAlignment.start,
        width: 50.0,
        lineHeight: 4.0,
        percent: 0.5,
        progressColor: mainColor,
      ),
      SizedBox(
        height: 10.0,
      ),
      Text(
        '${number}g left',
        style: greyTextStyle.copyWith(fontSize: 14),
      )
    ],
  );
}

Widget eatenWidget() {
  return Container(
    margin: const EdgeInsets.only(top: 10.0),
    child: Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 15.0),
          width: 3.0,
          height: 40.0,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                kPrimaryColor.withOpacity(0.4),
                kSecondaryColor.withOpacity(0.4)
              ])),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Eaten',
              style: greyTextStyle.copyWith(fontSize: 14.0),
            ),
            Row(
              children: [
                const Icon(Icons.abc),
                Text(
                  '  1127  ',
                  style: blackTextStyle.copyWith(fontSize: 18.0),
                ),
                Text(
                  ' kcal',
                  style: greyTextStyle.copyWith(fontSize: 12.0),
                )
              ],
            )
          ],
        ),
      ],
    ),
  );
}

Widget mealListCategory() {
  return Container(
    height: 280,
    child: ListView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      children: [
        mealCategoryItem(
            title: 'Breakfast',
            description: 'Bread, Peanut Butter, Apple',
            number: 525,
            colors: [kOrangeColor, Colors.orange.shade200]),
        mealCategoryItem(
            title: 'Lunch',
            description: 'Salmon, Mixed Veggies,Avocado',
            number: 602,
            colors: [kPrimaryColor, Colors.lightBlueAccent.shade200]),
        mealCategoryItem(
            title: 'Snack',
            description: 'Recommended 800 ',
            number: 602,
            colors: [kSecondaryColor, Colors.pinkAccent.shade200]),
      ],
    ),
  );
}

Widget mealCategoryItem(
    {required String title,
    required String description,
    required int number,
    required List<Color> colors}) {
  return Stack(
    children: [
      Container(
        width: 140,
        margin: const EdgeInsets.only(
            top: defaultMargin,
            bottom: defaultMargin,
            left: defaultMargin - 10),
        decoration: BoxDecoration(
            boxShadow: [kShadow],
            gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: colors),
            borderRadius: kBorderRadius),
        child: Stack(
          children: [
            Positioned(
                top: -60,
                left: -50,
                //positioned helps to position widget wherever we want.
                //position of the widget
                child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kWhiteColor
                            .withOpacity(0.3) //background color with opacity
                        ))),
            Padding(
              padding: const EdgeInsets.all(defaultMargin - 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(
                    flex: 5,
                  ),
                  Text(
                    title,
                    style: whiteTextStyle.copyWith(
                        fontWeight: extraBold, fontSize: 20),
                  ),
                  Spacer(),
                  Text(
                    description,
                    style: whiteTextStyle,
                  ),
                  Spacer(),
                  Text(
                    number.toString(),
                    style: whiteTextStyle.copyWith(
                        fontWeight: extraBold, fontSize: 30),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      Positioned(top: -5, left: 20, child: FlutterLogo(size: 70)),
    ],
  );
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: myAppBar(),
        body: ListView(
            physics: BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            children: [
              titleDivider('Mediterranean diet', 'Details'),
              statContainer(),
              titleDivider('Meals Today', 'Customize'),
              mealListCategory(),
              titleDivider('Body Measurement', 'Today'),
              statContainer(),
            ]),
      ),
    );
  }
}

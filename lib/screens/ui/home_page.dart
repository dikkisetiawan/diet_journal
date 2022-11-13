import 'package:diet_journal/screens/widgets/k_app_bar.dart';

import '../widgets/title_divider.dart';
import '../widgets/rounded_top_right_container.dart';
import '/screens/theme.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: kAppBar().myAppBar('My Diary'),
      body: ListView(
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          children: [
            TitleDivider(
              title: 'Mediterranean diet',
              buttonTitle: 'Details',
            ),
            RoundedTopRightContainer(child: mainStat()),
            TitleDivider(
              title: 'Meals Today',
              buttonTitle: 'Customize',
            ),
            mealListCategory(),
            TitleDivider(
              title: 'Body Measurements',
              buttonTitle: 'Today',
            ),
            RoundedTopRightContainer(child: mainStat()),
          ]),
    );
  }
}

Widget mainStat() {
  return Column(
    children: [
      Row(
        children: [
          Column(
            children: [
              consumedWiget('Eaten', 1127, 'myassets/noodle.png'),
              consumedWiget('Burned', 102, 'myassets/fire.png')
            ],
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
        percent: 0.8,
        linearGradient:
            LinearGradient(colors: [mainColor, mainColor.withOpacity(0.1)]),
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

Widget consumedWiget(String title, int number, String assetName) {
  return Container(
    margin: const EdgeInsets.only(top: 20.0),
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
              title,
              style: greyTextStyle.copyWith(fontSize: 14.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Image(width: 20, height: 20, image: AssetImage(assetName)),
                Text(
                  '  $number  ',
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
            colors: [kOrangeColor, Colors.orange.shade200],
            assetName: 'myassets/breakfast.png'),
        mealCategoryItem(
            title: 'Lunch',
            description: 'Salmon, Mixed Veggies,Avocado',
            number: 602,
            colors: [kPrimaryColor, Colors.lightBlueAccent.shade200],
            assetName: 'myassets/lunch.png'),
        mealCategoryItem(
            title: 'Snack',
            description: 'Recommended 800 ',
            colors: [kSecondaryColor, Colors.pinkAccent.withOpacity(0.7)],
            assetName: 'myassets/watermelon.png'),
        mealCategoryItem(
            title: 'Dinner',
            description: 'Recommended 703 ',
            colors: [kPrimaryColor, Colors.blue.shade200],
            assetName: 'myassets/beef.png'),
      ],
    ),
  );
}

Widget mealCategoryItem(
    {required String title,
    required String description,
    int? number,
    required List<Color> colors,
    required String assetName}) {
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
            //white circle
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
                  number == null
                      ? IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.add_circle_rounded,
                              color: kWhiteColor,
                              size: 50.0,
                              shadows: [kShadow]))
                      : Text(
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
      Positioned(
          top: 5,
          left: 20,
          child: Container(
              //imitate the image shadow
              decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                BoxShadow(
                    blurRadius: 20.0,
                    color: Colors.black38.withOpacity(0.2),
                    spreadRadius: 2.0,
                    offset: Offset(8.0, 8.0))
              ]),
              child:
                  Image(width: 60, height: 70, image: AssetImage(assetName)))),
    ],
  );
}

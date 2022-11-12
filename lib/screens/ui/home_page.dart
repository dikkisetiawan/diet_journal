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
    margin: const EdgeInsets.only(bottom: 20),
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
    margin: const EdgeInsets.only(bottom: defaultMargin),
    padding: const EdgeInsets.all(defaultMargin),
    decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
              blurRadius: 10,
              color: Colors.grey,
              spreadRadius: 0.0,
              offset: Offset.zero)
        ],
        color: Colors.white,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(defaultCircular),
            topLeft: Radius.circular(defaultCircular),
            bottomRight: Radius.circular(defaultCircular),
            topRight: Radius.circular(defaultTopLeftCircular))),
    child: Column(
      children: [
        Row(
          children: [
            Column(
              children: [eatenWidget(), eatenWidget()],
            ),
            Spacer(),
            circularIndicator()
          ],
        ),
        const Divider(
          height: 50.0,
          color: Colors.grey,
          thickness: 1.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [indicatorWidget(), indicatorWidget(), indicatorWidget()],
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

Widget indicatorWidget() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [const Text('Carbs'), const Text('12g left')],
  );
}

Widget eatenWidget() {
  return Container(
    margin: const EdgeInsets.only(top: 10.0),
    child: Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Eaten'),
            Row(
              children: [
                const Icon(Icons.abc),
                const Text(' 1127'),
                const Text(' kcal')
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
      scrollDirection: Axis.horizontal,
      children: [
        mealCategoryItem(),
        mealCategoryItem(),
        mealCategoryItem(),
        mealCategoryItem()
      ],
    ),
  );
}

Widget mealCategoryItem() {
  return Stack(children: [
    Container(
      width: 150,
      margin: const EdgeInsets.only(top: 30, bottom: 20, left: 30),
      padding: const EdgeInsets.all(30.0),
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                color: Colors.grey,
                spreadRadius: 0.0,
                offset: Offset.zero)
          ],
          color: Colors.orangeAccent,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              topLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
              topRight: Radius.circular(100.0))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(
            flex: 2,
          ),
          Text('Breakfast'),
          Spacer(),
          Text('Bread, Peanut Butter,  Apple'),
          Spacer(),
          Text('525kcal')
        ],
      ),
    ),
    Positioned(width: 150, child: FlutterLogo(size: 50)),
  ]);
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: myAppBar(),
        body: ListView(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
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

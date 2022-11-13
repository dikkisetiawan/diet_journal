import 'package:diet_journal/screens/widgets/k_app_bar.dart';
import 'package:flutter/material.dart';

import '../theme.dart';
import '../widgets/rounded_top_right_container.dart';
import '../widgets/title_divider.dart';

class TrainingPage extends StatelessWidget {
  const TrainingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: kAppBar().myAppBar('Training'),
      body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          children: [
            TitleDivider(
              title: 'Your Program',
              buttonTitle: 'Details',
            ),
            RoundedTopRightContainer(
              colors: [Colors.blue, kPrimaryColor],
              child: nextWorkoutWidget(),
            ),
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 30),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: roundedContainer(acknowledgementChildWidget(), 0.0),
                  ),
                ),
                Positioned(
                    top: -5,
                    left: 70,
                    child: Container(
                      decoration:
                          BoxDecoration(shape: BoxShape.circle, boxShadow: [
                        BoxShadow(
                            blurRadius: 20.0,
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 1.0,
                            offset: Offset(5.0, 5.0))
                      ]),
                      child: Image(
                          width: 80,
                          height: 100,
                          image: AssetImage('myassets/running.png')),
                    ))
              ],
            ),
            TitleDivider(
              title: 'Area of Focus',
              buttonTitle: 'More',
            ),
            areaOfFocusGridView()
          ]),
    );
  }

  Widget nextWorkoutWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Next Workout', style: whiteTextStyle.copyWith(fontSize: 14)),
        const SizedBox(
          height: 15,
        ),
        Text(
          'Legs Toning and Glutes Workout at Home',
          style: whiteTextStyle.copyWith(fontSize: 20),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, //give space between childrens
          crossAxisAlignment:
              CrossAxisAlignment.end, //stick childrens to bottom
          children: [
            Row(
              children: [
                Icon(
                  Icons.timer,
                  size: 18,
                  color: kWhiteColor,
                ),
                Text(
                  '   68 min',
                  style: whiteTextStyle.copyWith(fontSize: 12),
                )
              ],
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.play_circle_fill_rounded,
                  size: 50,
                  color: kWhiteColor,
                  shadows: [kShadow],
                ))
          ],
        )
      ],
    );
  }

  Widget roundedContainer(Widget child, double margin) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: defaultMargin,
      ),
      padding: EdgeInsets.all(margin),
      decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(defaultCircular),
          boxShadow: [kShadow]),
      child: child,
    );
  }

  Widget acknowledgementChildWidget() {
    return Stack(
      children: [
        Row(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          alignment: Alignment.centerLeft,
                          image: AssetImage('myassets/park.png'))),
                  height: 80,
                )),
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'You are doing great!',
                    style: buttonTextStyle.copyWith(fontSize: 16),
                  ),
                  Text(
                    'Keep it up and stick to your plan!',
                    style: greyTextStyle.copyWith(fontSize: 10),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget areaOfFocusGridView() {
    return GridView.count(
      padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
      shrinkWrap: true,
      crossAxisSpacing: defaultMargin,
      crossAxisCount: 2,
      children: [
        areaOfFocusTile('myassets/undraw_Grand_slam_re_44gi.png'),
        areaOfFocusTile('myassets/undraw_Running_wild_re_fq9r.png'),
        areaOfFocusTile('myassets/undraw_indoor_bike_pwa4.png'),
        areaOfFocusTile('myassets/undraw_Stability_ball_b4ia.png'),
      ],
    );
  }

  Widget areaOfFocusTile(String imagePath) {
    return roundedContainer(
        Image(width: 40, height: 40, image: AssetImage(imagePath)), 0.0);
  }
}

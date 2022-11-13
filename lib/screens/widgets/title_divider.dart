import 'package:flutter/material.dart';
import '/screens/theme.dart';

class TitleDivider extends StatelessWidget {
  String title = '';
  String buttonTitle = '';
  TitleDivider(
      {required String this.title,
      required String this.buttonTitle,
      super.key});

  @override
  Widget build(BuildContext context) {
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
}

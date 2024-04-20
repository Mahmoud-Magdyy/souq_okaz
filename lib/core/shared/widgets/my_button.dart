import 'package:flutter/material.dart';

import '../styles/my_colors.dart';

class MyButton extends StatelessWidget {
  final String text;
  final bool withArrow;
  final Function onPressed;
  const MyButton(
      {Key? key,
      required this.text,
      required this.withArrow,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton(
            onPressed: () => onPressed(),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(MyColors.primaryColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(45.0),
                ))),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                if (withArrow)
                const Align(
                  alignment: Alignment.centerRight,
                  child: CircleAvatar(
                    child: Icon(
                      Icons.keyboard_arrow_right_outlined,
                      size: 36,
                      color: MyColors.primaryColor,
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

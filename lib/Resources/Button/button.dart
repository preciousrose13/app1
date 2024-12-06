import 'package:app1/Resources/App%20Colors/appcolors.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final bool loading;
  const MyButton(
      {super.key,
      required this.text,
      required this.onTap,
      this.loading = false
      });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: MyColors.Peach,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: loading
                ? const CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  )
                : Text(
                    text,
                    style: const TextStyle(
                        fontSize: 20,
                        color: MyColors.Purple,
                        fontWeight: FontWeight.bold
                      ),
                  ),
          )),
    );
  }
}

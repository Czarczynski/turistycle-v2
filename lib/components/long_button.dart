import 'package:flutter/material.dart';
import 'package:turistycle/theme/colors.dart';

class LongButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  final IconData icon;

  const LongButton(
      {Key? key,
      required this.title,
      required this.onPressed,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.85,
        child: ElevatedButton(
          onPressed: () => onPressed(),
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            elevation: MaterialStateProperty.all(1),
            backgroundColor: MaterialStateProperty.all(cPeachCream),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(color: cCorfuShallows),
              ),
              Icon(icon, color: cCorfuShallows, size: 15,)
            ],
          ),
        ),
      ),
    );
  }
}

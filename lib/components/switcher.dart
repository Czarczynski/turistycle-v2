import 'package:flutter/material.dart';
import 'package:turistycle/theme/colors.dart';

class ModeSwitcher extends StatefulWidget {
  const ModeSwitcher({Key? key}) : super(key: key);

  @override
  State<ModeSwitcher> createState() => _ModeSwitcherState();
}

class _ModeSwitcherState extends State<ModeSwitcher> {
  // AnimationController _controller = AnimationController();

  bool _switched = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: cPeachCream,
          border: Border.all(color: cPeachCream),
          borderRadius: BorderRadius.circular(30),
        ),
        width: 60,
        height: 32,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Stack(
            children: [
              AnimatedPositioned(
                right: _switched ? 0 : 28,
                duration: const Duration(milliseconds: 200),
                child: InkWell(
                  onTap: () => setState(() {
                    _switched = !_switched;
                  }),
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        tileMode: TileMode.clamp,
                        colors: [cTemptatiousTangerine, cCreamySweetCorn],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      ),
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                width: _switched ? 15 : 5,
                bottom: _switched ? 2 : 7,
                top: _switched ? 2 : 7,
                left: _switched ? 27 : -5,
                duration: const Duration(milliseconds: 200),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: cPeachCream,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

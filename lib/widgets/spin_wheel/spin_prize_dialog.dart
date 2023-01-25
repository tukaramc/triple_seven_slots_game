import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:triple_seven_slots_game/assets.dart';
import 'package:triple_seven_slots_game/theme.dart';

class SpinPrizeDialog extends StatefulWidget {
  final int coins;
  const SpinPrizeDialog({required this.coins, Key? key}) : super(key: key);

  @override
  State<SpinPrizeDialog> createState() => _SpinPrizeDialogState();
}

class _SpinPrizeDialogState extends State<SpinPrizeDialog> with TickerProviderStateMixin {
  late final AnimationController _scaleAnimationController;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    _scaleAnimationController = AnimationController(duration: const Duration(seconds: 1), vsync: this)..forward();
    _scaleAnimation = CurvedAnimation(parent: _scaleAnimationController, curve: Curves.bounceOut);

    super.initState();
  }

  @override
  void dispose() {
    _scaleAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(coinIc),
          const SizedBox(height: 20),
          Text(widget.coins.toString(), style: TextStyles.bodyReg24),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'dashboard_container.dart';

class BoardItem extends StatelessWidget {
  const BoardItem({
    super.key,
    required this.width,
    required this.height,
    this.onAddPressed,
    this.strapRotation = 0,
    this.bodyRotation = 0,
  });

  final double width;
  final double height;
  final VoidCallback? onAddPressed;
  final double strapRotation;
  final double bodyRotation;

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -12,
            left: 0,
            right: 0,
            child: Center(
              child: _WalletStrapSide(),
            ),
          ),
          WalletSide(),
          Positioned(
            top: -12,
            left: 0,
            right: 0,
            child: Center(
              child: _WalletStrapSide(),
            ),
          ),
        ],
      ),
    );
  }
}

class _WalletStrapSide extends StatelessWidget {
  const _WalletStrapSide();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).dividerColor),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(85 / 2),
          bottomLeft: Radius.circular(100 / 2),
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withOpacity(0.5),
            blurRadius: 10,
          ),
        ],
      ),
      padding: const EdgeInsets.all(3),
      child: const DashedBorderContainer(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(85 / 2),
          bottomLeft: Radius.circular(100 / 2),
        ),
        dash: 3,
        gap: 3,
        borderWidth: 0.5,
      ),
    );
  }
}

class WalletSide extends StatelessWidget {
  final Color? color;
  const WalletSide({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).primaryColor,
        border: Border.all(color: Theme.of(context).dividerColor),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade100, blurRadius: 2, spreadRadius: 2),
        ],
      ),
      padding: const EdgeInsets.all(4),
      child: DashedBorderContainer(
        borderRadius: BorderRadius.circular(20),
        dash: 3,
        gap: 3,
        borderWidth: 0.5,
      ),
    );
  }
}

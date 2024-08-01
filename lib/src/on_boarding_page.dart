import 'dart:math';

import 'package:fancy_onboarding_screen/core/constants.dart';
import 'package:fancy_onboarding_screen/core/model/onboarding_item_model.dart';
import 'package:fancy_onboarding_screen/core/widgets/board_item.dart';
import 'package:fancy_onboarding_screen/core/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class FancyOnBoardingScreen extends StatefulWidget {
  final String? headingText;
  final TextStyle? headingTextStyle;
  final String? subHeadingText;
  final TextStyle? subHeadingTextStyle;
  final String? buttonText;
  final Widget? boardingPageButton;
  final Color? boardingScreenColor;
  final Color? activeIndicatorColor;
  final Duration duration;
  final Curve curve;
  final double viewportFraction;
  final List<OnBoardingItemModel>? onBoardingItems;
  final void Function() onBtnTap;
  final Color? backgroundColor;
  final Gradient? backgroundGradient;

  const FancyOnBoardingScreen(
      {Key? key,
      this.headingText,
      this.subHeadingText,
      this.headingTextStyle,
      this.subHeadingTextStyle,
      this.buttonText,
      this.boardingPageButton,
      this.boardingScreenColor,
      this.activeIndicatorColor,
      this.duration = const Duration(milliseconds: 300),
      this.curve = Curves.easeOut,
      this.viewportFraction = 0.7,
      this.onBoardingItems,
      required this.onBtnTap,
      this.backgroundColor,
      this.backgroundGradient})
      : super(key: key);

  @override
  State<FancyOnBoardingScreen> createState() => _FancyOnBoardingScreenState();
}

class _FancyOnBoardingScreenState extends State<FancyOnBoardingScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> rotationAnimation;
  late final PageController pageController;
  int activeIndex = 0;

  List<OnBoardingItemModel> onBoardingItemList = [];

  @override
  void initState() {
    onBoardingItemList = widget.onBoardingItems ??
        const [
          OnBoardingItemModel(
            title: 'Title 1',
            subtitle: 'Sub Title 1!',
            image: 'packages/fancy_onboarding_screen/assets/images/image1.png',
          ),
          OnBoardingItemModel(
            title: 'Title 2',
            subtitle: 'Sub Title 2!',
            image: 'packages/fancy_onboarding_screen/assets/images/image2.png',
          ),
          OnBoardingItemModel(
            title: 'Title 3',
            subtitle: 'Sub Title 3!',
            image: 'packages/fancy_onboarding_screen/assets/images/image3.png',
          ),
          OnBoardingItemModel(
            title: 'Title 4',
            subtitle: 'Sub Title 4!',
            image: 'packages/fancy_onboarding_screen/assets/images/image4.png',
          ),
        ];

    pageController = PageController(viewportFraction: widget.viewportFraction);
    animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    final curvedAnimation = CurvedAnimation(
      parent: animationController,
      curve: widget.curve,
    );
    rotationAnimation =
        Tween<double>(begin: 0, end: 30 * pi / 180).animate(curvedAnimation);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final itemWidth = screenSize.width * widget.viewportFraction;

    return Scaffold(
      backgroundColor: widget.backgroundColor,
      body: Container(
        decoration: BoxDecoration(gradient: widget.backgroundGradient),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              Center(
                child: Text(
                  widget.headingText ?? 'Heading (App Name)',
                  style: widget.headingTextStyle ??
                      Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: 26,
                          color: widget.boardingScreenColor ??
                              Theme.of(context).primaryColor),
                ),
              ),
              Center(
                child: Text(
                  widget.subHeadingText ?? 'Sub Heading (App Description)',
                  style: widget.subHeadingTextStyle ??
                      Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontSize: 12,
                          color: widget.boardingScreenColor ??
                              Theme.of(context).primaryColor,
                          letterSpacing: 2.0),
                ),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      left: -250 + 45,
                      width: 250,
                      top: -32,
                      bottom: -32,
                      child: WalletSide(color: widget.boardingScreenColor),
                    ),
                    Positioned.fill(
                      child: GestureDetector(
                        onTapDown: (_) => animationController.forward(),
                        onTapUp: (_) => animationController.reverse(),
                        child: PageView.builder(
                          controller: pageController,
                          itemCount: onBoardingItemList.length,
                          onPageChanged: (int index) {
                            setState(() {
                              activeIndex = index;
                            });
                            animationController.forward().then(
                                  (value) => animationController.reverse(),
                                );
                          },
                          itemBuilder: (context, index) {
                            return AnimatedScale(
                              duration: const Duration(milliseconds: 300),
                              scale: index == activeIndex ? 1 : 0.8,
                              curve: Curves.easeOut,
                              child: Container(
                                margin: EdgeInsets.all(kPadding / 2),
                                decoration: BoxDecoration(
                                  color: kWhite,
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(
                                      width: 0, color: Colors.transparent),
                                  boxShadow: [
                                    BoxShadow(
                                      color: kLightGreyColor.withOpacity(0.75),
                                      offset: const Offset(3, 4),
                                    ),
                                  ],
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      onBoardingItemList[index].image,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      left: -250 + 35,
                      width: 250,
                      top: -30,
                      bottom: -30,
                      child: AnimatedBuilder(
                        animation: animationController,
                        builder: (context, child) {
                          return Transform(
                            transform: Matrix4.identity()
                              ..setEntry(3, 2, 0.001)
                              ..rotateY(rotationAnimation.value),
                            alignment: Alignment.center,
                            child:
                                WalletSide(color: widget.boardingScreenColor),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: (screenSize.width - itemWidth) / 2,
                  right: (screenSize.width - itemWidth) / 2,
                  top: 40,
                  bottom: 50,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ..._buildItemInfo(activeIndex: activeIndex),
                    PageIndicator(
                      length: onBoardingItemList.length,
                      activeIndex: activeIndex,
                      activeColor: widget.activeIndicatorColor,
                    ),
                    widget.boardingPageButton ??
                        ButtonWidget(
                            title: widget.buttonText ?? 'Get Started!',
                            textColor: kWhite,
                            bgColor: widget.boardingScreenColor,
                            height: screenSize.height * 0.05,
                            onTap: widget.onBtnTap),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildItemInfo({int activeIndex = 0}) {
    return [
      Center(
        child: Text(
          onBoardingItemList[activeIndex].title,
          style: onBoardingItemList[activeIndex].titleTextStyle ??
              Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontSize: 16,
                  color:
                      onBoardingItemList[activeIndex].titleColor ?? kFullBlack,
                  fontWeight: FontWeight.bold),
        ),
      ),
      const SizedBox(height: 10),
      Center(
        child: Text(
          onBoardingItemList[activeIndex].subtitle,
          style: onBoardingItemList[activeIndex].subtitleTextStyle ??
              Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontSize: 16,
                  color: onBoardingItemList[activeIndex].subtitleColor ??
                      kLightBlack),
          // style: const TextStyle(fontSize: 16),
        ),
      ),
    ];
  }
}

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    this.length = 1,
    this.activeIndex = 0,
    this.activeColor,
  });

  final int length;
  final int activeIndex;
  final Color? activeColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SizedBox.fromSize(
        size: const Size.fromHeight(8),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final size = constraints.smallest;
            final activeWidth = size.width * 0.5;
            final inActiveWidth =
                (size.width - activeWidth - (2 * length * 2)) / (length - 1);

            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                    height: index == activeIndex ? 8 : 5,
                    width: index == activeIndex ? activeWidth : inActiveWidth,
                    decoration: BoxDecoration(
                      color: index == activeIndex
                          ? activeColor ?? Theme.of(context).primaryColor
                          : kLightGreyColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

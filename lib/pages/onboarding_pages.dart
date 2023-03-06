import 'package:flutter/material.dart';
import 'package:project_teamd/components/logo.dart';
import 'package:project_teamd/pages/landing_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../constants/color_pallete.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

PageController _pageController = PageController();
int index = 1;
Widget button = const Text('');

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    if (index == 2) {
      button = ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: beige,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LandingPage()),
          );
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(120, 12, 120, 12),
          child: Text(
            'Get Started ',
            style: TextStyle(fontSize: 16, color: green),
          ),
        ),
      );
    } else {
      button = Column(
        children: const [
          SizedBox(
            height: 28,
          ),
          Text(''),
        ],
      );
    }
    return Scaffold(
      backgroundColor: lightgreen,
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              children: [
                Slider(
                  title: 'A higher form of shopping.',
                  img: 'images/onboarding/online-shopping.png',
                  count: 1,
                  onLast: () {
                    setState(() {});
                  },
                ),
                Slider(
                  title: 'A few clicks is all it takes.',
                  img: 'images/onboarding/click.png',
                  count: 1,
                  onLast: () {
                    setState(() {});
                  },
                ),
                Slider(
                  title: 'Compare prices and quality.',
                  img: 'images/onboarding/compare.png',
                  count: 2,
                  onLast: () {
                    setState(() {});
                  },
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: 3,
                      effect: WormEffect(activeDotColor: green, dotColor: beige),
                      onDotClicked: (index) => _pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeOutCubic,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                button,
              ],
            ),
            Column(
              children: [
                const SizedBox(height: 16),
                Row(
                  children: const [
                    SizedBox(width: 12),
                    Logo(size: 180),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Slider extends StatefulWidget {
  final String title;

  final String img;
  final int count;
  final Function onLast;

  const Slider({super.key, required this.title, required this.img, required this.count, required this.onLast});

  @override
  State<Slider> createState() => _SliderState();
}

class _SliderState extends State<Slider> {
  @override
  Widget build(BuildContext context) {
    if (widget.count == 2) {
      index = 2;
      Future.delayed(Duration.zero, () async {
        widget.onLast();
      });
    } else {
      index = 1;
      Future.delayed(Duration.zero, () async {
        widget.onLast();
      });
    }
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            widget.img,
            width: 300,
          ),
          const SizedBox(
            height: 80,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 24),
            child: Text(
              widget.title,
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 40, color: beige),
            ),
          ),
        ],
      ),
    );
  }
}

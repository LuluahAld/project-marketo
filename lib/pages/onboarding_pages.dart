import 'package:flutter/material.dart';
import 'package:project_teamd/pages/user/home.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

PageController _pageController = PageController();
int index = 1;
Widget button = const Text('');

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    if (index == 2) {
      button = ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 72, 109, 245),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Home()),
          );
        },
        child: const Padding(
          padding: EdgeInsets.fromLTRB(120, 12, 120, 12),
          child: Text(
            'Get Started hi',
            style: TextStyle(fontSize: 16),
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              children: [
                Slider(
                  title: 'The best licensed counselors',
                  desc:
                      'A network of highly professional licensed and certified psychologists, social workers and doctors.',
                  img: 'images/onboarding/online-shopping.png',
                  count: 1,
                  onLast: () {
                    setState(() {});
                  },
                ),
                Slider(
                  title: 'Scheduled and Instant sessions',
                  desc:
                      'Psychological, emotional and couple sessions. Instant sessions within 60 minutes for emergencies or scheduled at the time and counselors of your choice.',
                  img: 'images/onboarding/click.png',
                  count: 1,
                  onLast: () {
                    setState(() {});
                  },
                ),
                Slider(
                  title: 'Complete Privacy',
                  desc:
                      'All conversation and sensitive data are end to end encrypted. No one can read them, not even Labayh.',
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
                      effect: const WormEffect(),
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
          ],
        ),
      ),
    );
  }
}

class Slider extends StatefulWidget {
  final String title;
  final String desc;
  final String img;
  final int count;
  final Function onLast;

  const Slider(
      {super.key,
      required this.title,
      required this.desc,
      required this.img,
      required this.count,
      required this.onLast});

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
          Image.asset(widget.img),
          const SizedBox(
            height: 24,
          ),
          Text(
            widget.title,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            widget.desc,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.blueGrey),
          ),
        ],
      ),
    );
  }
}

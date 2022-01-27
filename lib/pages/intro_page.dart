import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'Strings.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);
  static final String id = "intro_page";

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  PageController _pageController = PageController(initialPage: 0);
  int _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          // ## pageview
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _selectedPage = index;
                _pageController.animateToPage(_selectedPage, duration:Duration(milliseconds: 800), curve: Curves.ease);
              });
            },
            children: [
              // #page 1
              buildContainer(context,Strings.stepOneTitle,Strings.stepOneContent),

              // #page 2
              buildContainer(context,Strings.stepTwoTitle,Strings.stepTwoContent),

              // #page 3
              buildContainer(context,Strings.stepThreeTitle,Strings.stepThreeContent),

            ],
          ),

           // #indicator
          Container(
            alignment: Alignment(0, 0.9),
            child: SmoothPageIndicator(controller: _pageController, count: 3,
              effect: WormEffect(
                dotColor: Colors.deepOrange,
                activeDotColor: Colors.red,
                dotHeight: 5,
                dotWidth: 12
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildContainer(BuildContext context, String title, String subtitle) {
    return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Text(title,
                    style: TextStyle(fontSize: 30, color: Colors.red),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 220,
                    child: Text(subtitle,
                      style: TextStyle(
                          color: Colors.grey, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  SizedBox(
                    height: 50,
                  ),
                  Image(
                    height: 250,
                    image: AssetImage("assets/images/image_$_selectedPage.png"),
                  ),
                  SizedBox(
                    height: 50,
                  ),

                ],
              ),
            );
  }
}

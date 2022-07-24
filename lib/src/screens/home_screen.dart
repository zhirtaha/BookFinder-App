import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:my_book_finder/src/components/components.dart';
import 'package:my_book_finder/src/styles/colors/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final carouselImages = [
    'https://m.media-amazon.com/images/I/51Z0nLAfLmL.jpghttps://m.media-amazon.com/images/I/51Z0nLAfLmL.jpg',
    'https://m.media-amazon.com/images/I/51UU0FLH1wL.jpg',
    'https://images-na.ssl-images-amazon.com/images/I/81tCtHFtOgL.jpg',
    'https://images-na.ssl-images-amazon.com/images/I/61M1eEsuSML.jpg'
  ];

  int activeIndex = 0;
  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              'My Book Finder',
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'Find Your Favorite Book',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 25,
            ),
            Expanded(
              child: Stack(children: [
                CarouselSlider.builder(
                  carouselController: carouselController,
                  itemCount: carouselImages.length,
                  options: CarouselOptions(
                      height: 360,
                      enlargeCenterPage: true,
                      onPageChanged: ((index, reason) {
                        setState(() {
                          activeIndex = index;
                        });
                      })),
                  itemBuilder: ((context, index, realIndex) {
                    final carouselImage = carouselImages[index];
                    return buildCarouselImageItems(carouselImage, index);
                  }),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        // Use the controller to change the current page
                      carouselController.previousPage();
                      });
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        // Use the controller to change the current page
                      carouselController.nextPage();
                      });
                    },
                    icon: Icon(Icons.arrow_forward),
                  ),
                ),
              ]),
            ),
            AnimatedSmoothIndicator(
                effect: WormEffect(activeDotColor: secondaryColor),
                activeIndex: activeIndex,
                count: carouselImages.length)
          ],
        ),
      ),
    );
  }
}

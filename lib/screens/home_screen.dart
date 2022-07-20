import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:my_book_finder/components/components.dart';
import 'package:my_book_finder/styles/colors/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final carouselImages = [
    'https://images-na.ssl-images-amazon.com/images/I/61PJSnusanL.jpg',
    'https://m.media-amazon.com/images/I/51Z0nLAfLmL.jpg',
    'https://images-na.ssl-images-amazon.com/images/I/61M1eEsuSML.jpg'
  ];

  int activeIndex = 0;

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
              height: 40,
            ),
            Text(
              'Find Your Favorite Book',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Expanded(
              child: CarouselSlider.builder(
                itemCount: carouselImages.length,
                options: CarouselOptions(
                    height: 350,
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
            ),
            AnimatedSmoothIndicator(
              effect: WormEffect(
                activeDotColor: secondaryColor
              ),
              activeIndex: activeIndex, count: 
              carouselImages.length)
          ],
        ),
      ),
    );
  }
}

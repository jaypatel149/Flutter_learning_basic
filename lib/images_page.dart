// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<ImagePage> {
  int activeIndex = 0;
  final List<String> imagepage = [
    'assets/images/img_1.jpg',
    'assets/images/img_2.jpg',
    'assets/images/img_3.jpg',
    'assets/images/img_4.jpg',
    'assets/images/img_5.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Image Page...'),
          centerTitle: true,
          backgroundColor: Colors.grey,
        ),
        backgroundColor: Colors.red,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CarouselSlider.builder(
                options: CarouselOptions(
                    height: 500,
                    // autoPlay: true,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    autoPlayInterval: const Duration(seconds: 2),
                    onPageChanged: (index, reason) => setState(
                          () => activeIndex = index,
                        )),
                itemCount: imagepage.length,
                itemBuilder: (context, index, realIndex) {
                  final urlImage = imagepage[index];
                  return buildImage(urlImage, index);
                },
              ),
              const SizedBox(
                height: 30,
              ),
              buildIndicator(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImage(String urlImage, int index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        color: Colors.white,
        child: Image.asset(
          urlImage,
          fit: BoxFit.cover,
        ),
      );

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: imagepage.length,
        effect: const SlideEffect(activeDotColor: Color(0xFF9705A1)),
      );
}

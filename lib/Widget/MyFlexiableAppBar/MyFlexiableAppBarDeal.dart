import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../Models/Dimensions/Models_Dimensions.dart';
import '../Advert/Advert.dart';

class MyFlexiableAppBarDeal extends StatefulWidget {
  const MyFlexiableAppBarDeal();

  @override
  State<MyFlexiableAppBarDeal> createState() => _MyFlexiableAppBarDealState();
}

class _MyFlexiableAppBarDealState extends State<MyFlexiableAppBarDeal> {
  final double appBarHeight = 66.0;

  final urlImages = [
    // "https://img.freepik.com/free-photo/cool-geometric-triangular-figure-neon-laser-light-great-backgrounds-wallpapers_181624-9331.jpg?w=2000",
    // "https://cdnb.artstation.com/p/assets/video_clips/images/024/538/805/large/pixel-jeff-thumb.jpg?1582740711",
    "https://i.pinimg.com/originals/58/2d/96/582d96a1df2d94bb439af1594639ccfe.jpg",
    "https://marmotamaps.com/de/fx/wallpaper/download/faszinationen/Marmotamaps_Wallpaper_Berchtesgaden_Desktop_1920x1080.jpg",
    "https://i.pinimg.com/originals/8b/38/89/8b388987a365d4fd55dbf6adeae81ca7.jpg",
    "https://c4.wallpaperflare.com/wallpaper/500/442/354/outrun-vaporwave-hd-wallpaper-thumb.jpg",
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    var Dimensions = new Models_Dimensions();
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < mobileWidth) {
          return Container(
            height: statusBarHeight + appBarHeight,
            child: CarouselSlider.builder(
              itemCount: urlImages.length,
              itemBuilder: (context, index, realIndex) {
                final urlImage = urlImages[index];
                return buildImage(urlImage, index);
              },
              options: CarouselOptions(
                viewportFraction: 1,
                initialPage: 0,
                height: MediaQuery.of(context).size.height,
                autoPlay: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                // reverse: true,
                autoPlayInterval: Duration(seconds: 5),
                onPageChanged: ((index, reason) =>
                    setState(() => activeIndex = index)),
              ),
            ),
          );
        } else {
          return Container(
            height: statusBarHeight + appBarHeight,
            child: CarouselSlider.builder(
              itemCount: urlImages.length,
              itemBuilder: (context, index, realIndex) {
                final urlImage = urlImages[index];
                return buildImage(urlImage, index);
              },
              options: CarouselOptions(
                viewportFraction: 1,
                initialPage: 0,
                height: MediaQuery.of(context).size.height,
                autoPlay: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                // reverse: true,
                autoPlayInterval: Duration(seconds: 5),
                onPageChanged: ((index, reason) =>
                    setState(() => activeIndex = index)),
              ),
            ),
          );
        }
      },
    );
  }

  Widget buildImage(String urlImage, int index) => Container(
        color: Colors.grey,
        child: InkWell(
          child: Image.network(
            urlImage,
            fit: BoxFit.cover,
            width: 400,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Advert(activeIndex)),
            );
          },
        ),
      );
  Widget builIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: urlImages.length,
        effect: JumpingDotEffect(
          dotWidth: 10,
          dotHeight: 10,
          activeDotColor: Color.fromARGB(255, 7, 7, 7),
          dotColor: Colors.black12,
        ),
      );
}

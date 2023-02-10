import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../Advert/Advert.dart';
import '../../../Models/Dimensions/Models_Dimensions.dart';

class ScreensBar extends StatefulWidget {
  const ScreensBar();

  @override
  State<ScreensBar> createState() => _ScreensBar();
}

class _ScreensBar extends State<ScreensBar> {
  final urlImages = [
    "https://c4.wallpaperflare.com/wallpaper/500/442/354/outrun-vaporwave-hd-wallpaper-thumb.jpg",
    "https://img.freepik.com/free-photo/cool-geometric-triangular-figure-neon-laser-light-great-backgrounds-wallpapers_181624-9331.jpg?w=2000",
    "https://cdnb.artstation.com/p/assets/video_clips/images/024/538/805/large/pixel-jeff-thumb.jpg?1582740711",
    "https://i.pinimg.com/originals/58/2d/96/582d96a1df2d94bb439af1594639ccfe.jpg",
    "https://marmotamaps.com/de/fx/wallpaper/download/faszinationen/Marmotamaps_Wallpaper_Berchtesgaden_Desktop_1920x1080.jpg",
    "https://i.pinimg.com/originals/8b/38/89/8b388987a365d4fd55dbf6adeae81ca7.jpg",
  ];
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color.fromARGB(0, 0, 0, 0),
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                CarouselSlider.builder(
                  itemCount: urlImages.length,
                  itemBuilder: (context, index, realIndex) {
                    final urlImage = urlImages[index];
                    return buildImage(urlImage, index);
                  },
                  options: CarouselOptions(
                    viewportFraction: 1,
                    initialPage: 0,
                    height: 240,
                    autoPlay: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    // reverse: true,
                    autoPlayInterval: Duration(seconds: 5),
                    onPageChanged: ((index, reason) =>
                        setState(() => activeIndex = index)),
                  ),
                ),
                SizedBox(height: 10),
                builIndicator(),
              ],
            ),
          ),
        ),
      );
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

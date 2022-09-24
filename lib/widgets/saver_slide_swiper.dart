import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saver/constants.dart';

class SaverSlideSwiper extends StatelessWidget {
  final List<String> titles;
  final List<String> subTitles;
  final List<String> icons;
  const SaverSlideSwiper({
    Key? key,
    required this.titles,
    required this.subTitles,
    required this.icons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tight(const Size(300, 350)),
      child: Swiper(
        autoplay: true,
        autoplayDelay: 3000,
        index: 1,
        outer: false,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            child: Column(
              children: [
                SizedBox(
                  child: SvgPicture.asset(
                    "assets/icons/${icons[index]}.svg",
                    height: 160,
                  ),
                ),
                Text(
                  titles[index],
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 8.0),
                Text(
                  subTitles[index],
                  style: const TextStyle(color: blackColor80),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8.0),
              ],
            ),
          );
        },
        pagination: const SwiperPagination(margin: EdgeInsets.all(8.0)),
        itemCount: titles.length,
      ),
    );
  }
}

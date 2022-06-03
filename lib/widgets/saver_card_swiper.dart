import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saver/constants.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:saver/models/credit_card.dart';

class SaverCardSwiper extends StatelessWidget {
  final List<CreditCard> creditCardList;
  const SaverCardSwiper({
    Key? key,
    required this.creditCardList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        children: [
          Swiper(
            itemCount: creditCardList.length,
            itemWidth: _screenSize.width * 0.85,
            itemHeight: _screenSize.height * 0.28,
            layout: SwiperLayout.STACK,
            itemBuilder: (BuildContext context, int index) {
              creditCardList[index].uniqueId = '$index-tarjeta';

              // TODO need be implemented the HERO animation
              return //Hero(
                  //tag: creditCardList[index].uniqueId!,
                  //child:
                  GestureDetector(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  color: creditCardList[index].getColor(),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/images/Chip.png",
                          height: 48.0,
                        ),
                        Expanded(child: Container()),
                        Text(
                          creditCardList[index].name!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: lightGreyColor),
                        ),
                        Text(
                          creditCardList[index].goal!,
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: whiteColor),
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          children: [
                            Text(
                              creditCardList[index].number!,
                              style: const TextStyle(color: lightGreyColor),
                            ),
                            Expanded(child: Container()),
                            SvgPicture.asset(
                              creditCardList[index].getIcon(),
                              height: 16,
                            )
                          ],
                        ),
                        const SizedBox(height: 16.0)
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  print(creditCardList[index].name);
                },
              );
              //);
            },
          )
        ],
      ),
    );
  }
}

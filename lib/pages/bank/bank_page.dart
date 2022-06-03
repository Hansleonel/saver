import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saver/blocs/bank_bloc.dart';
import 'package:saver/constants.dart';
import 'package:saver/models/credit_card.dart';
import 'package:saver/widgets/saver_card_swiper.dart';

class BankPage extends StatelessWidget {
  const BankPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("PageBank");
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(
          width: defaultPadding,
        ),
        title: Center(
            child: Text(
          "Saver",
          style: Theme.of(context).textTheme.headline6,
        )),
        actions: [
          CircleAvatar(
            child:
                Image.asset("assets/images/Avatar.png", height: 32, width: 32),
          ),
          const SizedBox(
            width: defaultPadding,
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: double.infinity),
                SwiperWidgets(),
                const SizedBox(height: 24.0),
                Row(
                  children: [
                    Text(
                      "My Goals",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Expanded(child: Container()),
                    // const Icon(Icons.visibility),
                    // const SizedBox(width: 4.0),
                    // Text(
                    //   'View all',
                    //   style: Theme.of(context).textTheme.bodyText1,
                    // ),
                    Align(
                      child: TextButton(
                        child: Row(
                          children: [
                            const Icon(
                              Icons.visibility,
                              color: blackColor80,
                            ),
                            const SizedBox(width: 4.0),
                            Text(
                              'View all',
                              style: Theme.of(context).textTheme.bodyText1,
                            )
                          ],
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, 'plan');
                        },
                      ),
                    ),
                  ],
                ),
                Card(
                  elevation: 2.0,
                  shadowColor: Theme.of(context).primaryColor.withOpacity(0.6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  color: whiteColor,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 48,
                          width: 48,
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(32)),
                            child: Container(
                              color: whileColor80,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Money Completed',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                const SizedBox(width: 96.0),
                                Text(
                                  '40 %',
                                  style: Theme.of(context).textTheme.bodyText1,
                                )
                              ],
                            ),
                            const SizedBox(height: 16.0),
                            Stack(
                              children: [
                                SizedBox(
                                  height: 8,
                                  width: 250,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8)),
                                    child: Container(
                                      color: greyColor,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                  width: 200,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8)),
                                    child: Container(
                                      color: purpleColor,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 16.0),
                            Row(
                              children: [
                                Text(
                                  '01 Ene 2022',
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                const SizedBox(width: 96.0),
                                Text(
                                  '14 apr 2022',
                                  style: Theme.of(context).textTheme.bodyText2,
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  "My Record",
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 16.0),
                Text(
                  "Suggestions",
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 16.0),
                Text(
                  "Suggestions",
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 16.0),
                Text(
                  "Suggestions",
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 16.0),
                Text(
                  "Suggestions",
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 16.0),
                Text(
                  "Suggestions",
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 16.0),
                Text(
                  "Suggestions",
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 16.0),
                Text(
                  "Suggestions",
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 16.0),
                Text(
                  "Suggestions",
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 16.0),
                Text(
                  "Suggestions",
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 16.0),
                Text(
                  "Suggestions",
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SwiperWidgets extends StatelessWidget {
  SwiperWidgets({Key? key}) : super(key: key);

  final bankBloc = BankBloc();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: bankBloc.getCreditCards(),
      builder:
          (BuildContext context, AsyncSnapshot<List<CreditCard>> snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          return SaverCardSwiper(creditCardList: snapshot.data!);
        } else {
          return const SizedBox(
            height: 400,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}

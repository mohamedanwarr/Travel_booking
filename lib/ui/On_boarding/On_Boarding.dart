import 'package:flutter/material.dart';

import 'package:travelbooking/ui/On_boarding/listonboarding.dart';

import '../ authentication/Login/LoginScreen.dart';
import '../../generated/l10n.dart';

class On_Boarding extends StatefulWidget {
  const On_Boarding({Key? key}) : super(key: key);

  @override
  State<On_Boarding> createState() => _On_BoardingState();
}

class _On_BoardingState extends State<On_Boarding> {
 static int curruntindex = 0;
  PageController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<onboardinglist> content = [
      onboardinglist(
          image: 'assets/images/lets travel  .png',
          titleKey: S.of(context).lets_Travel,
          discribtionKey: S.of(context).lets_Travel_desc),
      onboardinglist(
          image: 'assets/images/Illustratiion.png',
          titleKey: S.of(context).plan_a_trip,
          discribtionKey: S.of(context).plan_a_trip_desc),
      onboardinglist(
          image: 'assets/images/Book a flight.png',
          titleKey: S.of(context).book_a_flight,
          discribtionKey: S.of(context).book_a_flight_desc)
    ];
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        onPageChanged: (int index) {
          setState(() {
            curruntindex = index;
          });
        },
        itemCount: content.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              const SizedBox(height: 20),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Image.asset(content[index].image,
                    width: width * 2,
                    // 321.31,
                    height: height * 0.4
                    //294.94,
                    ),
              ),
              const SizedBox(height: 20),
              Text(
                content[index].titleKey,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 32,
                ),
              ),
              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    content[index].discribtionKey,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),

              ),
              const SizedBox(height: 50),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      content.length, (index) => buildDot(index, context))),
              const SizedBox(height: 50),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        style: const ButtonStyle(
                            foregroundColor:
                                MaterialStatePropertyAll(Color(0xFF312DA4)),
                            elevation: MaterialStatePropertyAll(5),
                            textStyle: MaterialStatePropertyAll(TextStyle(
                                fontSize: 15,
                                color: Color(0xFF312DA4),
                                fontWeight: FontWeight.bold))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        child: Text(S.of(context).skip)),
                    GestureDetector(
                      onTap: () {
                        if (curruntindex == content.length - 1) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        }
                        _controller!.nextPage(
                            duration: const Duration(milliseconds: 100),
                            curve: Curves.bounceIn);
                      },
                      child: Container(
                        width: width * 0.250,
                        height: height * 0.050,
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 1, offset: Offset(0, 1))
                            ],
                            color: const Color(0xFFFEFEFE),
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const CircleAvatar(
                              radius: 15,
                              backgroundColor: Color(0xFF312DA4),
                              child: Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                            Text(
                              curruntindex == content.length - 1
                                  ? S.of(context).continue_button
                                  : S.of(context).next,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 6),
      height: 10,
      width: curruntindex == index ? 10 : 10,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: curruntindex == index
              ? const Color(0xFF312DA4)
              : const Color(0xFFCCD1FB)),
    );
  }
}

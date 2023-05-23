import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

// import my screens
import '../SignIn/sign_in.dart';
import '../SignUp/sign_up.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);
    


  @override
  Widget build(BuildContext context) {
    final pages = [splashScreen(context), const SignIn()];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Splash screen'),
        toolbarHeight: 0,
      ),
      body: LiquidSwipe(
        pages: pages,
        enableLoop: true,
        fullTransitionValue: 400,
        waveType: WaveType.liquidReveal,
        // positionSlideIcon: .6,
        // slideIconWidget: const Icon(
        //   Icons.arrow_back_ios,
        //   color: Colors.white,
        // ),
      ),
    );
  }

  Container splashScreen(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // padding: const EdgeInsets.all(30.0),
        decoration: BoxDecoration(
            color: const Color(0xFF272f32),
            image: DecorationImage(
                image: const AssetImage("assets/background/background_img.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.9), BlendMode.dstATop))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(50),
              child: const Text(
                'My Social',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 200),
                padding: const EdgeInsets.only(left: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Start a new',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'social Adventure.',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                )),
            Container(
              width: 100,
              margin: const EdgeInsets.only(top: 80),
              padding: const EdgeInsets.only(left: 50),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 8,
                    width: 8,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            width: 1,
                            color: Colors.white,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                    width: 8,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            width: 1,
                            color: Colors.white,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                    width: 8,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            width: 1,
                            color: Colors.white,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                    width: 8,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            width: 1,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.all(13.0),
              width: double.infinity,
              height: 168,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      const BorderRadius.only(topRight: Radius.circular(50)),
                  border: Border.all(
                      width: 1, color: Colors.grey, style: BorderStyle.solid)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Get involved with people and events',
                    style: TextStyle(
                        color: Color(0xFF272f32),
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  const Text(
                    'around you.',
                    style: TextStyle(
                        color: Color(0xFF272f32),
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 12),
                    width: 350,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const SignIn())));
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll(Color(0xFF22142b)),
                          foregroundColor:
                              const MaterialStatePropertyAll(Colors.white),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  side: const BorderSide(
                                      color: Color(0xFF22142b)))),
                          textStyle: const MaterialStatePropertyAll(TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold))),
                      child: const Text('Sign In'),
                    ),
                  ),
                  Container(
                      width: 300,
                      padding: const EdgeInsets.only(top: 0),
                      margin: const EdgeInsets.only(left: 80),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Or Create your account',
                            style: TextStyle(
                                color: Color(0xFF272f32),
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => const SignUp())));
                            },
                            iconSize: 30,
                            icon: const Icon(Icons.arrow_right_alt_rounded),
                          ),
                        ],
                      ))
                ],
              ),
            )
          ],
        )
        );
  }
}

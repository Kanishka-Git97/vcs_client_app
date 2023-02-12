import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vcs_client_app/Models/onboard_model.dart';
import 'package:vcs_client_app/Screens/Auth/login_screen.dart';

class OnBoard extends StatefulWidget {
  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  int currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _stroreOnBoardInfo() async {
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            TextButton(
              onPressed: () async {
                await _stroreOnBoardInfo();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => loginScreen()));
              },
              child: Text("Skip"),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: PageView.builder(
              itemCount: screens.length,
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(screens[index].img),
                    Container(
                      height: 10.0,
                      child: ListView.builder(
                          itemCount: screens.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 3.0),
                                  width: currentIndex == index ? 25.0 : 8.0,
                                  height: 8.0,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 52, 52, 52),
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                )
                              ],
                            );
                          }),
                    ),
                    Text(
                      screens[index].text,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 27.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      screens[index].desc,
                      textAlign: TextAlign.center,
                      style:
                          const TextStyle(fontSize: 14.0, color: Colors.black),
                    ),
                    InkWell(
                      onTap: () async {
                        if (index == screens.length - 1) {
                          await _stroreOnBoardInfo();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => loginScreen()));
                        }

                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.bounceIn,
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 10.0),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text(
                                "Next",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 15.0),
                              Icon(
                                Icons.arrow_forward_sharp,
                                color: Colors.white,
                              )
                            ]),
                      ),
                    ),
                  ],
                );
              }), //
        ));
  }
}

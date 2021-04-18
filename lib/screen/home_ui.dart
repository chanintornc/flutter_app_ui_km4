import 'package:flutter/material.dart';
import 'package:flutter_app_ui_km4/constants.dart';
import 'package:flutter_app_ui_km4/screen/welcome_ui.dart';

class HomeUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopBanner(size: size),
            Container(
              padding: EdgeInsets.all(38.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Winter\nVacation Trips',
                    style: TextStyle(
                      fontSize: 36.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87
                    ),
                  ),
                  SizedBox(height: 25),
                  Text(
                    'Enjoy your winter vacations with warmth and amazing sightseeing on the mountains. Enjoy the best experience with us!',
                    style: TextStyle(
                        fontSize: 16,
                        color: kTextColor
                    ),
                  ),
                  SizedBox(height: 40),
                  WelcomeButton(
                    tabEvent: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WelcomeUI(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class WelcomeButton extends StatelessWidget {
  const WelcomeButton({
    Key key,
    @required this.tabEvent
  }) : super(key: key);

  final GestureTapCallback tabEvent;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tabEvent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          color: kPrimaryColor,
        ),
        width: 200.0,
        height: 50.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25.0,
            vertical: 10.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Let\'s Go!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
              Image.asset(
                'assets/images/arrow.png',
                fit: BoxFit.scaleDown,
                height: 20.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TopBanner extends StatelessWidget {
  const TopBanner({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.5,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        ),
        child: Image.asset(
          'assets/images/welcome.jpg',
          height: size.height* 0.5,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

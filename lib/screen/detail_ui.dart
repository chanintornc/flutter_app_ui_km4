import 'package:flutter/material.dart';
import 'package:flutter_app_ui_km4/Models/Place.dart';
import 'package:flutter_app_ui_km4/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

bool isTab(BuildContext context) => MediaQuery.of(context).size.aspectRatio >= 0.74 && MediaQuery.of(context).size.aspectRatio < 1.5;

class DetailUI extends StatefulWidget {
  final Place place;

  const DetailUI({Key key, this.place}):super(key: key);

  @override
  _DetailUIState createState() => _DetailUIState();
}

class _DetailUIState extends State<DetailUI> {
  int days = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black87,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: size.height * 0.4,
            child: Hero(
              tag: widget.place.id,
              child: Image.asset(
                widget.place.image,
                height: size.height*0.4,
                width: size.width,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: size.height * 0.7,
            width: double.infinity,
            margin: EdgeInsets.only(
              top: size.height * 0.35
            ),
            padding: EdgeInsets.all(30.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(35.0),
                topLeft: Radius.circular(35.0),
              ),
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.place.name,
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/location_pin.svg'
                      ),
                      SizedBox(
                        width: 12.0,
                      ),
                      Text(
                        widget.place.location,
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: [
                      SmoothStarRating(
                        allowHalfRating: true,
                        onRated: (value) {},
                        starCount: 5,
                        rating: widget.place.rating,
                        size: 10.0,
                        isReadOnly: true,
                        color: kRatingStarColor,
                        borderColor: kRatingStarColor,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        widget.place.rating.toString(),
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Row(
                    children: [
                      Container(
                        width: isTab(context) ? 150 : 100,
                        height: isTab(context) ? 75 : 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: kInputBackgroundColor,
                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            StepperButton(
                              title: '-',
                              tapEvent: () {
                                this.setState(() {
                                  if (days > 1) { days -= 1; }
                                });
                              },
                            ),

                            Text(
                              days.toString(),
                              style: TextStyle(
                                  fontSize: isTab(context) ? 24 : 16,
                                  fontWeight: FontWeight.bold
                              ),
                            ),

                            StepperButton(
                              title: '+',
                              tapEvent: () {
                                this.setState(() {
                                  days += 1;
                                });
                              },
                            ),
                          ],
                        ),
                      ),

                      SizedBox(width: 20),

                      SvgPicture.asset(
                        'assets/icons/timer.svg',
                        width: isTab(context) ? 24 : 16,
                      ),

                      SizedBox(width: 10),

                      Text(
                        days.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: isTab(context) ? 24 : 18
                        ),
                      ),

                      SizedBox(width: 5),

                      Text(
                        'Days',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: isTab(context) ? 24 : 18
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Text(
                    'Description',
                    style: TextStyle(
                        fontSize: 20.0
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    widget.place.description,
                    style: TextStyle(
                      fontSize: 16.0
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '\$400',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                                color: kPrimaryColor,
                              ),
                            ),
                            TextSpan(
                              text: '/',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: kPrimaryColor,
                              ),
                            ),
                            TextSpan(
                              text: 'Package',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: kPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: (){},
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                              color: kPrimaryColor
                          ),
                          width: isTab(context) ? 300 : 150,
                          height: isTab(context) ? 70 : 50,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                            child: Text(
                              'Book Now',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: isTab(context) ? 25 : 16
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StepperButton extends StatelessWidget {
  const StepperButton({
    Key key,
    @required this.tapEvent,
    @required this.title
  }) : super(key: key);

  final GestureTapCallback tapEvent;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tapEvent,
      child: Container(
        width: isTab(context) ? 45 : 30,
        height: isTab(context) ? 75 : 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: kPrimaryColor
        ),

        child: Text(
          title,
          style: TextStyle(
              color: Colors.white,
              fontSize: isTab(context) ? 24 : 18
          ),
        ),
      ),
    );
  }
}
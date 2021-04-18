import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_ui_km4/Models/Place.dart';
import 'package:flutter_app_ui_km4/constants.dart';
import 'package:flutter_app_ui_km4/screen/detail_ui.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class WelcomeUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Discover',
          style: TextStyle(color: Colors.black54, fontSize: 27.0),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: ClipOval(
            child: Image.asset('assets/images/menu.png'),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: ClipOval(
              child: Image.asset('assets/images/avatar.png'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 75,
        width: double.infinity,
        margin: EdgeInsets.all(15.0),
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20.0,
              offset: const Offset(0, 3),
              color: Colors.black.withAlpha(20),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavItem(icon: 'assets/icons/home.svg', isActive: true),
            NavItem(icon: 'assets/icons/calendar.svg', isActive: false),
            NavItem(icon: 'assets/icons/search.svg', isActive: false),
            NavItem(icon: 'assets/icons/user.svg', isActive: false),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PlaceCategories(),
            PopularPlaces(),
            SafeArea(
              child: Recommemded(),
              bottom: false,
            ),
            SafeArea(
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding:EdgeInsets.all(20.0),
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 1.2,
                children: List.generate(
                    demoPlaces.length,
                    (index){
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context){
                              return DetailUI(
                                place: demoPlaces[index],
                              );
                            })
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Stack(
                            children: [
                              Hero(
                                tag: demoPlaces[index].id,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image.asset(
                                    demoPlaces[index].image,
                                    width: double.infinity,
                                    height: 200.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 70.0,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10.0,
                                      vertical: 5.0
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: kCardInfoBG.withOpacity(0.6),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              demoPlaces[index].name,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Spacer(),
                                            Container(
                                              width: 25.0,
                                              height: 25.0,
                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.white),
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: SvgPicture.asset('assets/icons/heart.svg'),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SmoothStarRating(
                                          allowHalfRating: true,
                                          onRated: (value) {},
                                          starCount: 5,
                                          rating: demoPlaces[index].rating,
                                          size: 10.0,
                                          isReadOnly: true,
                                          color: kRatingStarColor,
                                          borderColor: kRatingStarColor,
                                        ),
                                      ],
                                    ),

                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Recommemded extends StatelessWidget {
  const Recommemded({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: Row(
        children: [
          Text(
            'Recommeded',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18.0,
            ),
          ),
          Spacer(),
          TextButton(
            onPressed: () {},
            child: Text(
              'View All',
              style: TextStyle(fontSize: 14.0),
            ),
          )
        ],
      ),
    );
  }
}

//---------------------
class PopularPlaces extends StatefulWidget {
  const PopularPlaces({
    Key key,
  }) : super(key: key);

  @override
  _PopularPlacesState createState() => _PopularPlacesState();
}

class _PopularPlacesState extends State<PopularPlaces> {
  int cureentSlider = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 260.0,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  cureentSlider = value;
                });
              },
              controller: PageController(viewportFraction: 0.8, initialPage: 0),
              itemCount: demoPlaces.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                    right: 30.0,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                        image: AssetImage(demoPlaces[index].image),
                        fit: BoxFit.cover,
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 80.0,
                        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: kCardInfoBG.withOpacity(0.6),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  demoPlaces[index].name,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  width: 30.0,
                                  height: 30.0,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.white),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: SvgPicture.asset('assets/icons/heart.svg'),
                                  ),
                                ),
                              ],
                            ),
                            SmoothStarRating(
                              allowHalfRating: true,
                              onRated: (value) {},
                              starCount: 5,
                              rating: demoPlaces[index].rating,
                              size: 20.0,
                              isReadOnly: true,
                              color: kRatingStarColor,
                              borderColor: kRatingStarColor,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                demoPlaces.length,
                (index) {
                  return buildDotNav(index: index);
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  AnimatedContainer buildDotNav({int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      margin: EdgeInsets.only(right: 5.0),
      height: 6.0,
      width: cureentSlider == index ? 24 : 6,
      decoration: BoxDecoration(
        color: cureentSlider == index ? kPrimaryColor : kPrimaryColor.withAlpha(70),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

//----------------
class PlaceCategories extends StatefulWidget {
  const PlaceCategories({
    Key key,
  }) : super(key: key);

  @override
  _PlaceCategoriesState createState() => _PlaceCategoriesState();
}

class _PlaceCategoriesState extends State<PlaceCategories> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<String> placesCategoris = ["Popular", "Featured", "Most Visited", "Europe", "Asia", "Africa", "America", "Australia"];

    return Padding(
      padding: EdgeInsets.all(30.0),
      child: SizedBox(
        height: 25.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: placesCategoris.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Text(
                  placesCategoris[index],
                  style: TextStyle(
                    fontSize: 16.0,
                    color: selectedIndex == index ? kPrimaryColor : kTextColor,
                    fontWeight: selectedIndex == index ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

//----------------
class NavItem extends StatelessWidget {
  const NavItem({
    Key key,
    @required this.icon,
    @required this.isActive,
  }) : super(key: key);

  final String icon;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
        IconButton(
          icon: SvgPicture.asset(icon),
        ),
        Spacer(),
        Container(
          width: 35.0,
          height: 4.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: isActive ? kPrimaryColor : Colors.transparent,
            boxShadow: [
              BoxShadow(
                blurRadius: 6.0,
                offset: const Offset(0, -2),
                color: isActive ? kPrimaryColor : Colors.transparent,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

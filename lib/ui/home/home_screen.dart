import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pocket_college/theme_provider/theme_changer.dart';
import 'package:provider/provider.dart';
import 'package:pocket_college/helpers.dart';
import '../../theme_provider/theme_changer.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';

import './grid_details.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool darktheme = false;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    var themeChanger = Provider.of<ThemeChanger>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Pocket Campus'),
        actions: <Widget>[
          IconButton(
            icon: darktheme
                ? Icon(
                    Icons.wb_incandescent,
                    color: Colors.grey[400],
                  )
                : Icon(
                    Icons.wb_incandescent,
                    color: Colors.yellowAccent.shade100,
                  ),
            onPressed: () {
              if (darktheme == false) {
                themeChanger.setTheme(ThemeMode.dark);
                setState(() {
                  darktheme = true;
                });
                print(darktheme);
              } else {
                themeChanger.setTheme(ThemeMode.light);
                setState(() {
                  darktheme = false;
                });
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext ctx) {
                  return AboutDialog(
                    applicationIcon: Image(
                      image: NetworkImage("https://via.placeholder.com/50x50"),
                    ),
                    applicationName: "Pocket Campus",
                    applicationLegalese: "Copyright 2020",
                    applicationVersion: "v1.0",
                    children: <Widget>[
                      SizedBox(height: 15),
                      Divider(
                        color: Theme.of(context).accentColor,
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: <Widget>[
                          Text("Get the code"),
                          GestureDetector(
                            child: Text(
                              " here",
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                            onTap: () {
                              launchURL(
                                  "https://github.com/we-developers-community/pocket_college");
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Made by our lovely",
                                ),
                                GestureDetector(
                                  child: Text(
                                    " contributors",
                                    style: TextStyle(
                                      color: Colors.blue,
                                    ),
                                  ),
                                  onTap: () => launchURL(
                                      "https://github.com/we-developers-community/pocket_college/graphs/contributors"),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Container(
        height: mediaQuery.size.height * 0.9,
        width: mediaQuery.size.width,
        child: Column(
          children: <Widget>[
            Container(
              height: mediaQuery.size.height * 0.3,
              width: mediaQuery.size.width,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: ColorFiltered(
                colorFilter: darktheme
                    ? ColorFilter.mode(Colors.black26, BlendMode.luminosity)
                    : ColorFilter.mode(Colors.white, BlendMode.darken),
                child: 
                
                // Carousel(
                //   boxFit: BoxFit.fill,
                //   autoplay: true,
                //   autoplayDuration: Duration(seconds: 10),
                //   borderRadius: true,
                //   radius: Radius.circular(16),
                //   animationCurve: Curves.fastOutSlowIn,
                //   animationDuration: Duration(milliseconds: 2500),
                //   dotSize: 5.0,
                //   dotIncreasedColor: Colors.blue,
                //   dotBgColor: Colors.transparent,
                //   dotVerticalPadding: 10.0,
                //   showIndicator: true,
                //   indicatorBgPadding: 7.0,
                //   images: [
                //     NetworkImage(
                //         'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSkaqXbA0rN7lUU5jqZwCgKzk8vEOpdZv1FVPVEuDKoFylXpwJt&usqp=CAU'),
                //     NetworkImage(
                //         'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS6h78lYHp1wlzfY7a-TG3d6_my8KCy-9I3Cg&usqp=CAU'),
                //     NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT3ZeqJx4xeIkrsJW5EJKXFukGYhCnyYGKl6A&usqp=CAU'),
                //   ],
                // ),
              ),
            ),
            // Container(
            //   height: mediaQuery.size.height * 0.3,
            //   width: mediaQuery.size.width,
            //   margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            //   decoration: BoxDecoration(
            //     gradient: LinearGradient(
            //       colors: darktheme
            //           ? [Colors.grey.shade900, Colors.grey.shade900]
            //           : [Colors.blue, Colors.indigoAccent],
            //     ),
            //     borderRadius: BorderRadius.circular(15),
            //   ),
            //   child: ClipRRect(
            //     borderRadius: BorderRadius.circular(15),
            //     child: ColorFiltered(
            //       colorFilter: darktheme
            //           ? ColorFilter.mode(Colors.black26, BlendMode.luminosity)
            //           : ColorFilter.mode(Colors.white, BlendMode.darken),
            //       child: Image.network(
            //         'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSkaqXbA0rN7lUU5jqZwCgKzk8vEOpdZv1FVPVEuDKoFylXpwJt&usqp=CAU',
            //         fit: BoxFit.fill,
            //       ),
            //     ),
            //   ),
            // ),
            Container(
              height: mediaQuery.size.height * 0.35,
              width: mediaQuery.size.width,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Consumer<GridDetails>(
                builder: (context, gridDetails, child) => GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  itemCount: gridDetails.texts.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1 / 1,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 30,
                  ),
                  itemBuilder: (ctx, index) => InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(gridDetails.className[index]);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          colors: darktheme
                              ? [Colors.grey.shade800, Colors.grey.shade800]
                              : [Colors.blue, Colors.indigoAccent],
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            gridDetails.icons[index],
                            color: Colors.white,
                          ),
                          Text(
                            '${gridDetails.texts[index]}',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

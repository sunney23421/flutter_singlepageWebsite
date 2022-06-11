import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:responsive_website/widgets/bottom_bar.dart';
import 'package:responsive_website/widgets/carousel.dart';
import 'package:responsive_website/widgets/featured_heading.dart';
import 'package:responsive_website/widgets/featured_tiles.dart';
import 'package:responsive_website/widgets/floating_quick_access_bar.dart';
import 'package:responsive_website/widgets/main_heading.dart';
import 'package:responsive_website/widgets/menu_drawer.dart';
import 'package:responsive_website/widgets/top_bar_contents.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;
    // more score more appbaer visiable
    ////custom opacity

    return Scaffold(
      extendBodyBehindAppBar: true,
      //less that 800 is mobile device
      //if?true:flse
      appBar: screenSize.width < 800
          ? AppBar(
            iconTheme: IconThemeData(color:Colors.blue),
              backgroundColor: Colors.white.withOpacity(_opacity),
              title: const Text(
                "Author",
                style: TextStyle(
                  color: Color(0xFF077bd7),
                  fontSize: 26,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w900,
                  letterSpacing: 3,
                ),
              ),
              elevation: 0,
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, 70),
              child: TopBarContents(_opacity),
            ),
            drawer: MenuDrawer(),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Stack(
              //overlap
              children: [
                SizedBox(
                  height: screenSize.height * 0.65,
                  //using 60% of screen height
                  width: screenSize.width,
                  child: Image.asset(
                    'assets/images/background.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  children: [
                    FloatingQuickAccessBar(screenSize: screenSize),
                    FeaturedHeading(screenSize: screenSize),
                    FeaturedTiles(screenSize: screenSize),
                    MainHeading(screenSize: screenSize),
                    MainCarousel(),
                    SizedBox(
                      height: screenSize.height / 10,
                    ),
                    BottomBar(),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

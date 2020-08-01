import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          ClipPath(
            clipper: BannerClipper(),
            child: Container(
              height: screenHeight * 0.2,
              width: screenWidth,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    Color(0xFFEE7C54),
                    Color(0xFFFFDA59),
                  ],
                ),
              ),
              child: Container(
                padding: EdgeInsets.fromLTRB(
                    screenWidth * 0.33, 0, screenWidth * 0.33, 0),
                child: Image.asset(
                  "assets/piksele.png",
                  scale: 0.2,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BannerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.6,
        size.width * 0.6, size.height * 0.8);
    path.quadraticBezierTo(
        size.width * 0.8, size.height * 0.9, size.width, size.height * 0.7);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

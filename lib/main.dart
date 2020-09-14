import 'package:diamond_notched_fab/diamond_fab_notched_shape.dart';
import 'package:diamond_notched_fab/diamond_notched_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twahod_app/res/fontsRes.dart';
import 'package:twahod_app/res/images.dart';
import 'package:twahod_app/res/strings.dart';
import 'logic/tts.dart';
import 'res/colors.dart';

void main() {
  runApp(MyApp());
}

Tts tts;
String _name;


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    tts = new Tts();
    return MaterialApp(
      title: titleApp,
      theme: ThemeData(
        primaryColor: primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      bottomNavigationBar: buildBottomAppBar(),
      body: buildBody(),
      floatingActionButton: buildFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  Widget buildFab() {
    return DiamondNotchedFab(
      onPressed: () {
        tts.speak(textToSpeak: _name);
      },
      backgroundColor: greenColor,
      child: Icon(Icons.volume_up),
    );
  }

  BottomAppBar buildBottomAppBar() {
    return BottomAppBar(
      notchMargin: 4,
      shape: DiamondFabNotchedShape(),
      color: primaryColor,
      child: buildTextField(),
    );
  }

  Widget buildTextField() {
    return Padding(
      padding: const EdgeInsets.only(right: 100, top: 8, bottom: 8, left: 16),
      child: TextField(
        onChanged: (String written) {
          _name = written;
        },
        cursorColor: blueColor,
        style:
        TextStyle(fontFamily: familyHomos, color: blueColor, fontSize: 18),
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: yellowSurfaceColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: yellowSurfaceColor)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            labelText: inputHint,
            labelStyle: TextStyle(
              fontSize: 16,
              fontFamily: familyHomos,
              color: blueColor,
            )),
      ),
    );
  }

  Container buildBody() {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          buildTitleLayer(),
          buildCardsLayer(),
        ],
      ),
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage(imgBackground),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildCardsLayer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildCard(text: feelingsSad, image: imgFeelingsSad),
              buildCard(text: feelingsHappy, image: imgFeelingsHappy),
            ],
          ),
          SingleChildScrollView(

            scrollDirection:Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildCard(text: feelingsWater, image: imgFeelingsWater),
                buildCard(text: feelingsMe, image: imgFeelingsMe),
                buildCard(text: feelingsHungry, image: imgFeelingsHungry),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildCard(text: feelingsNo, image: imgFeelingsNo),
              buildCard(text: feelingsYes, image: imgFeelingsYes),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildCard({String image, String text}) {
    return SizedBox(
      width: 110,
      child: Card(
        elevation: 6,
        shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: InkWell(
          splashColor: blueColor,
          onTap: () => {tts.speak(textToSpeak: text)},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    right: 10, left: 10, top: 10, bottom: 10),
                child: SvgPicture.asset(
                  image,
                  width: 80,
                  height: 80,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  text,
                  style: TextStyle(fontFamily: familyHomos, fontSize: 26),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildTitleLayer() {
    return Padding(
      padding: const EdgeInsets.only(top: 48),
      child: Center(
          child: Text(
            titleApp,
            style: TextStyle(
              fontSize: 35,
              fontFamily: familyHomos,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(0, 4.0),
                  blurRadius: 4,
                  color: Colors.grey,
                )
              ],
            ),
          )),
    );
  }
}

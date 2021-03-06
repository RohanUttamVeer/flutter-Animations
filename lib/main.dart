import 'package:flutter/material.dart';
import 'animation_widget/rotation_animation.dart';
import 'animation_widget/slide_animation.dart';
import 'animation_widget/transform_animation.dart';

//navigation created
void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({key}) : super(key: key);

  static const String _title = 'Animation App';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData.dark(),
      title: _title,
      home: Scaffold(
        // appBar: AppBar(title: const Text(_title)),
        // body: const MyStatefulWidget(),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  var anime = Myanimation();
  bool selected = false;
  bool selected1 = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      title: 'Animation App',
      home: Scaffold(
          body: Column(
        children: [
          Padding(
              padding: EdgeInsets.all(8.0),
              child: Wrap(direction: Axis.horizontal, children: [
                // GestureDetector(
                //   onTap: () {
                //     setState(() {
                //       selected = !selected;
                //     });
                //   },
                Container(
                  width: 150,
                  height: 150,
                  child: AnimatedAlign(
                    // #1 Animation Align
                    alignment:
                        selected ? Alignment.topLeft : Alignment.bottomRight,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeOutCubic,
                    // heightFactor: 5.0,
                    // widthFactor: 5.0,
                    // ignore: deprecated_member_use
                    child: ElevatedButton(
                        child: Text("rohan bro"),
                        onPressed: () {
                          setState(() {
                            selected = !selected;
                          });
                          // ),
                        }),
                  ),
                ),
                Myanimation(),
                SlideAnimation(),
                transformAnimation(),

                // un-comment the block below for individual animation
                // also change selected to selected1 in animatedContainer
                // GestureDetector(
                //   onTap: () {
                //     setState(() {
                //       selected1 = !selected1;
                //     });
                //   },
                // child:

                AnimatedContainer(
                  width: selected ? 160.0 : 80.0,
                  height: selected ? 80.0 : 160.0,
                  color: selected ? Color(0xFFB3E5FC) : Color(0xFFA5D6A7),
                  alignment: selected
                      ? Alignment.center
                      : AlignmentDirectional.topCenter,
                  duration: const Duration(seconds: 2),
                  curve: Curves.elasticInOut,
                  child: const FlutterLogo(size: 70),
                ),
                // ),
              ])),
        ],
      )),
    ));
  }
}

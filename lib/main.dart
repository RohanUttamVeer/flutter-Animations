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
        appBar: AppBar(title: const Text(_title)),
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        title: 'Animation App',
        themeMode: ThemeMode.dark,
        home: Scaffold(
          body: Column(
            children: [
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

              AnimatedContainer(
                width: selected ? 100.0 : 50.0,
                height: selected ? 50.0 : 100.0,
                color: selected ? Colors.greenAccent : Colors.purpleAccent,
                alignment: selected
                    ? Alignment.center
                    : AlignmentDirectional.topCenter,
                duration: const Duration(seconds: 2),
                curve: Curves.elasticInOut,
                child: const FlutterLogo(size: 75),
              ),
            ],
          ),
        ));
  }
}

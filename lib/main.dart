import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
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
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        themeMode: ThemeMode.dark,
        home: Scaffold(
          body: Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selected = !selected;
                  });
                },
                child: Container(
                  width: 300,
                  height: 400,
                  child: AnimatedAlign(
                      alignment:
                          selected ? Alignment.bottomRight : Alignment.bottomLeft,
                      duration: const Duration(seconds: 1),
                      curve: Curves.bounceInOut,
                      // ignore: missing_required_param
                      child: ElevatedButton(
                        child: Text("rohan bhai"),
                        // onPressed: () => nonVirtual,
                      )),
                ),
              )
            ],
          ),
        ));
  }
}

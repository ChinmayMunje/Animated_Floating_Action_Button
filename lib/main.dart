import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GFG',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Geeks for Geeks'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();
  String IsOpened = "No";
  String message = "";
  String BtnText = "OpenMenu";

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title, textAlign: TextAlign.center),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to GFG",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "$message",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            )
          ],
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
        ),
      ),
      floatingActionButton: Builder(
        builder: (context) => FabCircularMenu(
          key: fabKey,
          alignment: Alignment.bottomCenter,
          ringColor: Colors.teal,
          ringDiameter: 260.0,
          ringWidth: 70.0,
          fabSize: 70.0,
          fabElevation: 8.0,
          fabColor: Colors.green,
          fabOpenIcon: Icon(Icons.menu, color: Colors.white),
          fabCloseIcon: Icon(Icons.close, color: Colors.red),
          fabMargin: const EdgeInsets.all(10.0),
          animationDuration: const Duration(milliseconds: 800),
          animationCurve: Curves.easeInOutCirc,
          onDisplayChange: (isOpen) {
            if (isOpen) {
              setState(() {
                IsOpened = "Yes";
                isOpen = !isOpen;
              });
            } else {
              setState(() {
                IsOpened = "No";
                isOpen = !isOpen;
              });
            }
          },
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 50, 0),
              child: FloatingActionButton(
                heroTag: "FAB_Home",
                child: Icon(Icons.home),
                onPressed: () {
                  setState(() {
                    message = "Welcome to \n Home Screen";
                    if (fabKey.currentState!.isOpen) {
                      fabKey.currentState!.close();
                    }
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 70, 0),
              child: FloatingActionButton(
                heroTag: "FAB_Settings",
                child: Icon(Icons.settings),
                onPressed: () {
                  setState(() {
                    message = "Welcome to \n Settings Screen";
                    if (fabKey.currentState!.isOpen) {
                      fabKey.currentState!.close();
                    }
                  });
                },
              ),
            ), //70, 30, 0, 0)
            Padding(
              padding: const EdgeInsets.fromLTRB(70, 30, 0, 0),
              child: FloatingActionButton(
                heroTag: "FAB_Comments",
                child: Icon(Icons.comment),
                onPressed: () {
                  setState(() {
                    if (fabKey.currentState!.isOpen) {
                      fabKey.currentState!.close();
                    }
                    message = "Welcome to \n Comments Screen";
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 120, 0, 0),
              child: FloatingActionButton(
                heroTag: "FAB_Share",
                child: Icon(Icons.share),
                onPressed: () {
                  setState(() {
                    if (fabKey.currentState!.isOpen) {
                      fabKey.currentState!.close();
                    }
                    message = "Welcome to \n Share Screen";
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

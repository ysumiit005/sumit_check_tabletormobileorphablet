import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final String isTablet = DeviceDetector.isTabletOrMobile(context);s
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            // Text(
            //   'Orientation: ${OrientationHelper.getOrientationText(OrientationHelper.getOrientation(context))}',
            //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            // ),
            const Text(
              'Device Type:',
            ),
            Text(
              DeviceDetector.isTabletOrMobile(context),
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

//
// custom orientation helper sumit
//
// class OrientationHelper {
//   static Orientation getOrientation(BuildContext context) {
//     return MediaQuery.of(context).orientation;
//   }

//   static String getOrientationText(Orientation orientation) {
//     return orientation == Orientation.portrait ? "Portrait" : "Landscape";
//   }
// }

class DeviceDetector {
  static String isTabletOrMobile(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final Orientation orientation = MediaQuery.of(context).orientation;

    // Define a threshold to differentiate between phones and tablets
    // final double tabletThreshold = 600.0;

    String whatTypeOfDeviceIsit = 'null';

    print("sumit ====> ${screenWidth}");
    print("sumit ====> ${screenHeight}");

    //if landscape
    if (orientation == Orientation.landscape) {
      // check height
      if (screenHeight > 550) {
        print("tablet");
        whatTypeOfDeviceIsit = "tablet";
        // return whatTypeOfDeviceIsit;
      }
      if (screenHeight >= 500 && screenHeight <= 550) {
        print("tablet");
        whatTypeOfDeviceIsit = "pha-tablet";
        // return whatTypeOfDeviceIsit;
      }
      if (screenHeight < 500) {
        print("mobile");
        whatTypeOfDeviceIsit = "mobile";
        // return whatTypeOfDeviceIsit;
      }
    }

    // if potrait
    if (orientation == Orientation.portrait) {
      if (screenWidth > 550) {
        print("tablet");
        whatTypeOfDeviceIsit = "tablet";
        // return whatTypeOfDeviceIsit;
      }
      if (screenWidth >= 500 && screenWidth <= 550) {
        print("tablet");
        whatTypeOfDeviceIsit = "pha-tablet";
        // return whatTypeOfDeviceIsit;
      }
      if (screenWidth < 500) {
        print("mobile");
        whatTypeOfDeviceIsit = "mobile";
        // return whatTypeOfDeviceIsit;
      }
    }

    return whatTypeOfDeviceIsit;
  }
}

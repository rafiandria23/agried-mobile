import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ProductivityScreen extends StatefulWidget {
  ProductivityScreen({Key? key}) : super(key: key);

  static const String route = '/resources/productivity';

  @override
  _ProductiviryScreenState createState() => _ProductiviryScreenState();
}

class _ProductiviryScreenState extends State<ProductivityScreen> {
  static const String URL =
      'https://usfarmersandranchers.org/stories/sustainable-food-production/5-tools-and-technologies-that-drive-sustainable-agriculture';

  late WebViewController webViewController;

  int _progress = 0;

  @override
  void initState() {
    super.initState();

    webViewController = WebViewController();
    webViewController.setJavaScriptMode(JavaScriptMode.unrestricted);
    webViewController.setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          setState(() {
            _progress = progress;
          });
        },
      ),
    );
    webViewController.loadRequest(Uri.parse(URL));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productivity'),
        bottom: PreferredSize(
          preferredSize: Size.zero,
          child: LinearProgressIndicator(
            value: _progress / 100,
            backgroundColor: Colors.white,
            valueColor: AlwaysStoppedAnimation<Color>(
              Colors.blue,
            ),
          ),
        ),
      ),
      body: WebViewWidget(controller: webViewController),
    );
  }
}

// class ProductivityScreen extends StatefulWidget {
//   ProductivityScreen({Key? key}) : super(key: key);

//   static const String route = '/resources/productivity';

//   @override
//   _ProductivityScreenState createState() => _ProductivityScreenState();
// }

// class _ProductivityScreenState extends State<ProductivityScreen> {
//   String coverText =
//       '5 Tools and Technologies That Drive Sustainable Agriculture';

//   String descriptionText =
//       "These innovations not only reduce agriculture’s environmental footprint — they can make the farm operation more profitable.";

//   String digitalSensorsText = '''
//     Sensor technologies available today monitor every aspect of agriculture, from aerial imagery to cattle movement to micro-climate data collection to even telling producers the precise pH level of the soil.

//     The application of sensor technology is just scratching the surface, and will continue to provide producers more precise data in order to make better, more informed decisions, ensuring their production remains sustainable.
//   ''';

//   String irrigationText = '''
//     Irrigation is a critical part of food production, and producers continue to look for ways to make the absolute best use — and least amount — of water. Technology has made significant headway in making irrigation practices more efficient and more sustainable.

//     "Wireless remote monitoring and control systems enable farmers to gain better control and visibility over the operations of their irrigation systems, and to make better decisions regarding water, chemical and electrical usage,” according to Sandro Esposito, with SignalFire Wireless Telemetry, a company that sells wireless crop and irrigation control systems.
//   ''';

//   String dronesText = '''
//     The use of drones in agriculture will continue to grow and evolve as producers harness this very powerful technology in various aspects of their production. Drones can carry a wide array of sensors and cameras that can continually monitor crop growing conditions. “Initially used for chemical spraying, today drones are a great tool for capturing aerial imagery with platform-mounted cameras and sensors,” says Ines Hajdu, agronomy expert with Agrivi. “Images can range from simple visible-light photographs to multi-spectral imagery that can be used to assess different aspects of plant health, weeds and assets.”
//   ''';

//   String biotechnologyText = '''
//     There’s no question that the advent of biotechnology has had a profound effect on agriculture. It has become a tool available to crop breeders who can now develop plants with specific traits. And while crop breeding has been a part of agriculture for centuries, biotechnology allows for faster and more precise breeding methods. According to the International Food Information Council Foundation, “In addition to fighting the environmental stresses of disease and pests, researchers in both academia and industry are currently working on developing crops that use water more efficiently to help with growth in drought conditions.”

//     Additionally, CRISPR technologies, which are used to edit genes, could be used to improve yield and disease tolerance in crops. According to the International Service for the Acquisition of Agri-biotech Applications, “Early studies using CRISPR – Cas9 for gene editing have focused on crops important for agriculture. It was realized early on that the system could be used in crops to improve traits, such as yield, plant architecture, plant aesthetics and disease tolerance.” Biotechnology also has many potential applications in animal agriculture. “Since the early 1980s, transgenic animals have been created with increased growth rates, enhanced lean muscle mass, enhanced resistance to disease or improved use of dietary phosphorous to lessen the environmental impacts of animal manure,” says the North Carolina Association for Biomedical Research.
//   ''';

//   String fleetManagementText = '''
//     Advanced telemetry systems and GPS have positively affected fleet management in agriculture. The most basic systems can locate equipment in use. More advanced systems can give precise information, including engine speed, fuel usage and upcoming maintenance, and give immediate alerts. But that’s not all: the collection of data can then be analyzed to identify where specific crop inputs are needed and where they are not, for example. The goal, ultimately, is to make the most efficient use of equipment.
//   ''';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Productivity'),
//       ),
//       body: SafeArea(
//         child: ListView(
//           padding: EdgeInsets.all(
//             ResponsiveFlutter.of(context).moderateScale(8.0),
//           ),
//           children: <Widget>[
//             Padding(
//               padding: EdgeInsets.only(
//                 bottom: ResponsiveFlutter.of(context).moderateScale(20.0),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: <Widget>[
//                   Image(
//                     image: AssetImage(
//                       'assets/icons/logo.png',
//                     ),
//                     height: ResponsiveFlutter.of(context).verticalScale(64.0),
//                   ),
//                 ],
//               ),
//             ),

//             // Cover
//             Image(
//               image: AssetImage(
//                 'assets/dummies/productivity/cover.png',
//               ),
//               height: ResponsiveFlutter.of(context).verticalScale(128.0),
//             ),
//             Text(
//               coverText,
//               textAlign: TextAlign.start,
//               style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//                 fontSize: ResponsiveFlutter.of(context).fontSize(3.5),
//               ),
//             ),

//             // Description
//             Text(
//               descriptionText,
//               textAlign: TextAlign.justify,
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: ResponsiveFlutter.of(context).fontSize(2.0),
//               ),
//             ),

//             // Digital Sensors
//             Text(
//               '1. Digital Sensors',
//               textAlign: TextAlign.start,
//               style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//                 fontSize: ResponsiveFlutter.of(context).fontSize(3.0),
//               ),
//             ),
//             Image(
//               image: AssetImage(
//                 'assets/dummies/productivity/digital_sensors.png',
//               ),
//               height: ResponsiveFlutter.of(context).verticalScale(200.0),
//             ),
//             Text(
//               digitalSensorsText,
//               textAlign: TextAlign.justify,
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: ResponsiveFlutter.of(context).fontSize(1.5),
//               ),
//             ),

//             // Irrigation
//             Text(
//               '2. Irrigation',
//               textAlign: TextAlign.start,
//               style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//                 fontSize: ResponsiveFlutter.of(context).fontSize(3.0),
//               ),
//             ),
//             Image(
//               image: AssetImage(
//                 'assets/dummies/productivity/irrigation.png',
//               ),
//               height: ResponsiveFlutter.of(context).verticalScale(200.0),
//             ),
//             Text(
//               irrigationText,
//               textAlign: TextAlign.justify,
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: ResponsiveFlutter.of(context).fontSize(1.5),
//               ),
//             ),

//             // Drones
//             Text(
//               '3. Drones',
//               textAlign: TextAlign.start,
//               style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//                 fontSize: ResponsiveFlutter.of(context).fontSize(3.0),
//               ),
//             ),
//             Image(
//               image: AssetImage(
//                 'assets/dummies/productivity/drones.png',
//               ),
//               height: ResponsiveFlutter.of(context).verticalScale(200.0),
//             ),
//             Text(
//               dronesText,
//               textAlign: TextAlign.justify,
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: ResponsiveFlutter.of(context).fontSize(1.5),
//               ),
//             ),

//             // Biotechnology
//             Text(
//               '4. Biotechnology',
//               textAlign: TextAlign.start,
//               style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//                 fontSize: ResponsiveFlutter.of(context).fontSize(3.0),
//               ),
//             ),
//             Image(
//               image: AssetImage(
//                 'assets/dummies/productivity/biotechnology.png',
//               ),
//               height: ResponsiveFlutter.of(context).verticalScale(200.0),
//             ),
//             Text(
//               biotechnologyText,
//               textAlign: TextAlign.justify,
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: ResponsiveFlutter.of(context).fontSize(1.5),
//               ),
//             ),

//             // Fleet Management
//             Text(
//               '4. Fleet Management',
//               textAlign: TextAlign.start,
//               style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//                 fontSize: ResponsiveFlutter.of(context).fontSize(3.0),
//               ),
//             ),
//             Image(
//               image: AssetImage(
//                 'assets/dummies/productivity/fleet_management.png',
//               ),
//               height: ResponsiveFlutter.of(context).verticalScale(200.0),
//             ),
//             Text(
//               fleetManagementText,
//               textAlign: TextAlign.justify,
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: ResponsiveFlutter.of(context).fontSize(1.5),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

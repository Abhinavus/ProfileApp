import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:profile_app/slimycard.dart';
import 'package:slimy_card/slimy_card.dart';
import 'package:url_launcher/url_launcher.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 102, 84, 88),
        primaryColorLight: Color.fromARGB(255, 128, 108, 112),
        accentColor: Color(0xFF1B1F32),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void>_makePhoneCall(String url) async{
    
      await launch(url);
   
  }


 
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey[300],
      
      body: StreamBuilder(
        initialData: false,
        stream: slimyCard.stream,
        builder: ((BuildContext context, AsyncSnapshot snapshot) {
          return ListView(
            children: <Widget>[
              SizedBox(
                height: 150.0,
              ),
              SlimyCard(
                // by default color blue
                color: Colors.black,
                width: 300.0,
                // borderRadius: 0.0, // max 30
                slimeEnabled: true,
                topCardHeight: 350.0,
                bottomCardHeight: 100.0,
                topCardWidget: _topCard(
                  (snapshot.data) ? logo : logoRound,
                ),
                bottomCardWidget: _bottomCard(),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _topCard(String image) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 100.0,width: 100,
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color:Colors.white,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Image(
            image: AssetImage(logo),
          ),
        ), 
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Abhinavu S',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28.0,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
        
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Flutter Developer',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        
      ],
    );
  }

  Widget _bottomCard() {
    return Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [ SizedBox.fromSize(
  size: Size(56, 56), // button width and height
  child: ClipOval(
    child: Material(
      color: Color.fromARGB(255, 75, 167, 241), // button color
      child: InkWell(
        splashColor: Colors.green, // splash color
        onTap: () {
          setState(() {
            _makePhoneCall('tel:919074055157');
          });
        }, // button pressed
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.call), // icon
             // text
          ],
        ),
      ),
    ),
  ),
),  SizedBox.fromSize(
  size: Size(56, 56), // button width and height
  child: ClipOval(
    child: Material(
      color: Color.fromARGB(255, 75, 167, 241), // button color
      child: InkWell(
        splashColor: Colors.green, // splash color
        onTap: () async {var texturl ="https://wa.me/919074055157";
                                       
                                        await launch(texturl);}, // button pressed
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.message), // icon
            
          ],
        ),
      ),
    ),
  ),
),SizedBox.fromSize(
  size: Size(56, 56), // button width and height
  child: ClipOval(
    child: Material(
      color: Color.fromARGB(255, 75, 167, 241), // button color
      child: InkWell(
        splashColor: Colors.green, // splash color
        onTap: () async {var texturl ="https://github.com/Abhinavus";
                                       
                                        await launch(texturl);}, // button pressed
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.hub), // icon
            // text
          ],
        ),
      ),
    ),
  ),
), 
SizedBox.fromSize(
  size: Size(56, 56), // button width and height
  child: ClipOval(
    child: Material(
      color: Color.fromARGB(255, 75, 167, 241), // button color
      child: InkWell(
        splashColor: Colors.green, // splash color
        onTap: () async {var texturl ="https://www.linkedin.com/in/abhinavu-s-30a99a21a/";
                                       
                                        await launch(texturl);}, // button pressed
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.link), // icon
             // text
          ],
        ),
      ),
    ),
  ),
),

      
       
      ],
    );
  }
}
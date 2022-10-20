import 'package:flutter/material.dart';
import 'package:flutter_mapbox_autocomplete/flutter_mapbox_autocomplete.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter MapBox AutoComplete',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _startPointController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter MapBox AutoComplete example"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: CustomTextField(
          hintText: "Select starting point",
          textController: _startPointController,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MapBoxAutoCompleteWidget(
                  apiKey:
                      'pk.eyJ1IjoiZWpheWVlZSIsImEiOiJjbDVzbHd1bWIwOGtyM2NwMzQxdTloeGh2In0.ZG_zLWjR7rGr7nbHv_Vz-g',
                  hint: "Select starting point",
                  onSelect: (place) {
                    // TODO : Process the result gotten
                    _startPointController.text = place.placeName!;
                  },
                  limit: 10,
                ),
              ),
            );
          },
          enabled: true,
        ),
      ),
    );
  }
}

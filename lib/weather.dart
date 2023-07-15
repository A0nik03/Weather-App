import 'package:api/fetch.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('REST API Example'),
      ),
      body: FutureBuilder(
          future: WeatherData.getData(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return Column(
                children: [
                  Text(snapshot.data!.main!.temp.toString()),
                ],
              );
            }
            else{
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}

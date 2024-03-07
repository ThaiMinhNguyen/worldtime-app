import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    String bgImage = data['isDatetime'] ? 'day.png' : 'night.png';
    Color? bgColor = data['isDatetime'] ? Colors.blue[800] : Colors.indigo[900];
    // print(data);
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(e
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextButton.icon(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      textStyle: TextStyle(fontSize: 18),
                    ),
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(
                          context, '/location');
                      // print(result);
                      setState(() {
                        data = {
                          'location': result['location'],
                          'time': result['time'],
                          'flag': result['flag'],
                          'isDatetime': result['isDatetime'],
                        };
                      }
                      );
                      print(data);
                    },
                    icon: Icon(Icons.location_on, color: Colors.grey,),
                    label: Text(
                      'Edit location',
                      style: TextStyle(
                          color: Colors.grey
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['location'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white60
                        ),
                      ),
                      // Text(data['time'])
                    ],
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      data['time'],
                      style: TextStyle(
                          fontSize: 60,
                          color: Colors.white60
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}

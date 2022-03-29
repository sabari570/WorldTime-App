import 'package:flutter/material.dart';
import 'package:worldtime_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(location: 'India', flag: 'assets/India.png', url: 'Asia/Kolkata'),
    WorldTime(
        location: 'New York',
        flag: 'assets/New_york.png',
        url: 'America/New_York'),
    WorldTime(
        location: 'Mexico City',
        flag: 'assets/Mexico.png',
        url: 'America/Mexico_City'),
    WorldTime(
        location: 'Casey', flag: 'assets/Casey.png', url: 'Antarctica/Casey'),
    WorldTime(
        location: 'Bangkok', flag: 'assets/Bangkok.png', url: 'Asia/Bangkok'),
    WorldTime(location: 'Dubai', flag: 'assets/Dubai.png', url: 'Asia/Dubai'),
    WorldTime(location: 'Tokyo', flag: 'assets/Tokyo.png', url: 'Asia/Tokyo'),
    WorldTime(location: 'Seoul', flag: 'assets/Seoul.png', url: 'Asia/Seoul'),
    WorldTime(
        location: 'Singapore',
        flag: 'assets/Singapore.png',
        url: 'Asia/Singapore'),
    WorldTime(
        location: 'Melbourne',
        flag: 'assets/Melbourne.png',
        url: 'Australia/Melbourne'),
    WorldTime(
        location: 'London', flag: 'assets/London.png', url: 'Europe/London'),
  ];
  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Location'),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(locations[index].flag),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

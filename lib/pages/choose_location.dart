import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'gb'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'de'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'in'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'sa'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'us'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'ae'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'sk'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'fr'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();

    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Choose Location'),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(
                      'https://www.countryflags.io/${locations[index].flag}/flat/64.png'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

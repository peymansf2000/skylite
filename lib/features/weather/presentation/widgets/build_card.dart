import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:skylite/features/weather/data/models/day_model.dart';

class BuildCard extends StatelessWidget {
  final DayModel day;
  // final String formattedDate = formattedDate;

  const BuildCard({
    Key? key,
    required this.day,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(getDatefromTimeStamp(day.timeStamp),
            style: const TextStyle(fontStyle: FontStyle.italic)),
        Image.asset('assets/icons/${day.icon}@2x.png'),
        Text('${day.tempMax.toString()}\u00B0',
            style: const TextStyle(fontStyle: FontStyle.italic))
      ],
    );
  }
}

String getDatefromTimeStamp(int timeStamp) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
  String formattedDate = DateFormat('MMM dd').format(dateTime);
  return formattedDate;
}

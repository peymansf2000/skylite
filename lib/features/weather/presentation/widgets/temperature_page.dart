import 'package:flutter/material.dart';
import 'package:skylite/features/weather/domain/entities/weather_entity.dart';

class TemperaturePage extends StatelessWidget {
  const TemperaturePage({
    super.key,
    required this.height,
    required this.weatherEntity,
  });

  final double height;
  final WeatherEntity weatherEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: height / 15,
        ),
        Text(
          weatherEntity.name,
          style: const TextStyle(
              fontSize: 30,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: height / 50,
        ),
        SizedBox(
          width: 250,
          child: Text(
            weatherEntity.day[0].description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 13, fontStyle: FontStyle.italic),
          ),
        ),
        Image.asset('assets/icons/${weatherEntity.day[0].icon}@2x.png'),
        Text(
          '${weatherEntity.day[0].temp}\u00B0',
          style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: height / 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const Text('Max',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                Text(
                  '${weatherEntity.day[0].tempMax.toString()}\u00B0',
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              color: Colors.black,
              width: 1.5,
              height: 40,
            ),
            Column(
              children: [
                const Text('Min',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                Text('${weatherEntity.day[0].tempMin.toString()}\u00B0',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold)),
              ],
            )
          ],
        )
      ],
    );
  }
}

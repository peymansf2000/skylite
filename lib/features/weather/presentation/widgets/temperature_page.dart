import 'package:flutter/material.dart';
import 'package:skylite/features/weather/domain/entities/current_city_entity.dart';

class TemperaturePage extends StatelessWidget {
  const TemperaturePage({
    super.key,
    required this.height,
    required this.currentCityEntity,
  });

  final double height;
  final CurrentCityEntity currentCityEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: height / 15,
        ),
        Text(
          currentCityEntity.name!,
          style: const TextStyle(
              fontSize: 30,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold),
        ),
        Text(
          currentCityEntity.weather![0].description!,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        Image.asset(
            'assets/icons/${currentCityEntity.weather![0].icon!}@2x.png'),
        Text(
          '${currentCityEntity.main!.temp!.round()}\u00B0',
          style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text('Max',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                Text(
                  '${currentCityEntity.main!.tempMax!.round().toString()}\u00B0',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
              color: Colors.black,
              width: 1.5,
              height: 40,
            ),
            Column(
              children: [
                Text('Min',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                Text(
                    '${currentCityEntity.main!.tempMin!.round().toString()}\u00B0',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              ],
            )
          ],
        )
      ],
    );
  }
}

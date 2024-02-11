import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skylite/core/params/forecast_params.dart';
import 'package:skylite/core/widgets/dot_loading_widget.dart';
import 'package:skylite/features/weather/domain/usecases/get_suggestion_city_usecase.dart';
import 'package:skylite/features/weather/presentation/bloc/home_bloc.dart';
import 'package:skylite/features/weather/presentation/widgets/humidity_page.dart';
import 'package:skylite/features/weather/presentation/widgets/temperature_page.dart';
import 'package:skylite/locator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/build_card.dart';
import '../widgets/suggestion_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final SuggestionParams _params =
      SuggestionParams(name: 'Berlin', location: '52.516,13.3769');
  final TextEditingController _textEditingController = TextEditingController();
  final GetSuggestionCityUsecase _getSuggestionCityUsecase =
      GetSuggestionCityUsecase(locator());

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(HomeStarted(params: _params));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeCompleted:
            final PageController controller = PageController(initialPage: 0);
            final weatherEntity = (state as HomeCompleted).weatherEntity;
            final List<Widget> pagesList = [
              TemperaturePage(height: height, weatherEntity: weatherEntity),
              const HumidityPage()
            ];

            return SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SuggestionField(
                    textEditingController: _textEditingController,
                    getSuggestionCityUsecase: _getSuggestionCityUsecase,
                  ),
                  Center(
                    child: SizedBox(
                      width: width * 0.8,
                      height: kIsWeb ? height * 0.55 : height * 0.45,
                      child: PageView(
                        controller: controller,
                        children: pagesList,
                      ),
                    ),
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      effect: const ExpandingDotsEffect(
                          dotColor: Colors.black,
                          activeDotColor: Colors.black,
                          spacing: 5,
                          dotHeight: 10,
                          dotWidth: 10),
                      controller: controller,
                      count: pagesList.length,
                      onDotClicked: (index) => controller.animateToPage(index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear),
                    ),
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  const Divider(
                    thickness: 2,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: height / 60,
                  ),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return index == 0
                            ? const SizedBox()
                            : BuildCard(day: weatherEntity.day[index]);
                      },
                      itemCount: weatherEntity.day.length,
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                    color: Colors.black,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              "wind speed",
                              style: TextStyle(
                                  fontSize: height * 0.017,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                "${weatherEntity.day[0].windSpeed} m/s",
                                style: TextStyle(
                                    fontSize: height * 0.016,
                                    color: Colors.amber,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            color: Colors.black,
                            height: 30,
                            width: 2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            children: [
                              Text(
                                "sunrise",
                                style: TextStyle(
                                    fontSize: height * 0.017,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  formatTimestampToHourMinutes(((weatherEntity
                                                  .day[0].sunriseEpoch +
                                              weatherEntity.tzoffset * 3600) *
                                          1000)
                                      .toInt()),
                                  style: TextStyle(
                                    fontSize: height * 0.016,
                                    color: Colors.amber,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            color: Colors.black,
                            height: 30,
                            width: 2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            children: [
                              Text(
                                "sunset",
                                style: TextStyle(
                                  fontSize: height * 0.017,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  formatTimestampToHourMinutes(((weatherEntity
                                                  .day[0].sunsetEpoch +
                                              weatherEntity.tzoffset * 3600) *
                                          1000)
                                      .toInt()),
                                  style: TextStyle(
                                    fontSize: height * 0.016,
                                    color: Colors.amber,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            color: Colors.black,
                            height: 30,
                            width: 2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            children: [
                              Text(
                                "humidity",
                                style: TextStyle(
                                  fontSize: height * 0.017,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  "${weatherEntity.day[0].humidity}%",
                                  style: TextStyle(
                                    fontSize: height * 0.016,
                                    color: Colors.amber,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          case HomeError:
            return const Center(
                child: Text(
              'Error',
              style: TextStyle(color: Colors.white),
            ));
          case HomeLoading:
            return const Expanded(child: DotLoadingWidget());
          default:
            return const Center(
                child: Text(
              'Unknown State',
              style: TextStyle(color: Colors.white),
            ));
        }
      },
    );
  }
}

String formatTimestampToHourMinutes(int timestamp) {
  // Convert timestamp to DateTime
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);

  // Format the DateTime as "hour:minutes"
  String formattedTime =
      '${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';

  return formattedTime;
}

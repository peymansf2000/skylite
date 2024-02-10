import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:skylite/core/params/forecast_params.dart';
import 'package:skylite/features/weather/data/models/geodb/suggest_city_model/datum.dart';
import 'package:skylite/features/weather/domain/usecases/get_suggestion_city_usecase.dart';
import 'package:skylite/features/weather/presentation/bloc/home_bloc.dart';

class SuggestionField extends StatelessWidget {
  const SuggestionField({
    super.key,
    required TextEditingController textEditingController,
    required GetSuggestionCityUsecase getSuggestionCityUsecase,
  })  : _textEditingController = textEditingController,
        _getSuggestionCityUsecase = getSuggestionCityUsecase;

  final TextEditingController _textEditingController;
  final GetSuggestionCityUsecase _getSuggestionCityUsecase;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TypeAheadField<Datum>(
        controller: _textEditingController,
        builder: (context, controller, focusNode) {
          return TextField(
              controller: controller,
              focusNode: focusNode,
              autofocus: false,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter a city...'));
        },
        itemBuilder: (context, model) {
          return ListTile(
            leading: const Icon(Icons.location_on),
            title: Text(model.name!),
            subtitle: Text("${model.region!}, ${model.country!}"),
          );
        },
        suggestionsCallback: (String prefix) async {
          return _getSuggestionCityUsecase(prefix);
        },
        onSelected: (Datum model) {
          _textEditingController.text = model.name!;
          BlocProvider.of<HomeBloc>(context).add(HomeStarted(
              params: SuggestionParams(
                  location: '${model.latitude!},${model.longitude}',
                  name: model.name!)));
        },
      ),
    );
  }
}

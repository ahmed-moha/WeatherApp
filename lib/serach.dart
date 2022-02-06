import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:weather/weather.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Weather? weather;
  bool isLoading = false;
  final openWeather = WeatherFactory('e4a486125aac55acaa9d2ad7dbf26c61');
  String cityName = '';

  getWeather() async {
    try {
      isLoading = true;
      setState(() {});
      weather = await openWeather.currentWeatherByCityName(cityName);
      isLoading = false;
      setState(() {});
    } catch (e) {
      print('THE ERROR $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        elevation: 0,
        title: const Text('Search by city name'),
      ),
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(22.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    cityName = value;
                  });
                },
                decoration: InputDecoration(
                    hintText: 'Seach by City',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          getWeather();
                        },
                        icon: const Icon(
                          Icons.search,
                          color: Colors.cyan,
                        ))),
              ),
            ),
            Expanded(
              child: weather != null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${weather!.temperature!.celsius!.round()} °C',
                          style: TextStyle(fontSize: 55.0),
                        ),
                        Text('${weather!.weatherDescription}'),
                      ],
                    )
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}

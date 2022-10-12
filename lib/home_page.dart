// ignore_for_file: prefer_typing_uninitialized_variables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/weatherData.dart';

var dayInfo = DateTime.now();
var dateFormat = DateFormat('EEEE, D MMM, YYYY').format(dayInfo);

// ignore: must_be_immutable, use_key_in_widget_constructors
class HomePage extends StatelessWidget {
  var client = WeatherData();
  var data;

  info() async {
    // var position = await getPosition();
    data = await client.getData('42.87', '74.6');
    return data;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: FutureBuilder(
      future: info(),
      builder: (context, snapshot) {
        return Container(
          child: Column(
            children: [
              Container(
                height: size.height * 0.75,
                width: size.width,
                padding: const EdgeInsets.only(top: 30),
                margin: const EdgeInsets.only(right: 10, left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  gradient: const LinearGradient(
                      colors: [
                        Color(0xff955cd1),
                        Color(0xff3fa2fa),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: [0.2, 0.85]),
                ),
                child: Column(
                  children: [
                    Text(
                      '${data?.cityName}',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 35,
                          fontFamily: 'MavenPro'),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Monday 03 Mars',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 15,
                          fontFamily: 'MavenPro'),
                    ),
                    // Image.asset(
                    //   'assets/images/sun.png',
                    //   width: size.width * 0.4,
                    // ),
                    Image.network(
                      'https:${data?.icon}',
                      width: size.width * 0.36,
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${data?.condition}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 45,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Hubballi'),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '${data?.temp}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 75,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Hubballi'),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/sandstorm.png',
                                width: size.width * 0.15,
                              ),
                              Text(
                                '${data?.wind} km/h',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Hubballi',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'wind',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.6),
                                    fontFamily: 'MavenPro',
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/humidity.png',
                                width: size.width * 0.15,
                              ),
                              Text(
                                '${data?.humidity}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Hubballi',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'humidity',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.6),
                                    fontFamily: 'MavenPro',
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/wind-direction.png',
                                width: size.width * 0.15,
                              ),
                              Text(
                                '${data?.wind_dir}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Hubballi',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'wind direction',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.6),
                                    fontFamily: 'MavenPro',
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          '${data?.gust}',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontFamily: 'MavenPro',
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text('32.0 kp/h',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'MavenPro',
                              fontSize: 23,
                            )),
                        const SizedBox(height: 20),
                        Text(
                          '${data?.pressure}',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontFamily: 'MavenPro',
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text('1025.0 hpa',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'MavenPro',
                              fontSize: 23,
                            )),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          '${data?.uv}',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontFamily: 'MavenPro',
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text('1.0',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'MavenPro',
                              fontSize: 23,
                            )),
                        const SizedBox(height: 20),
                        Text(
                          '${data?.pricipe}',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontFamily: 'MavenPro',
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text('0.0 mm',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'MavenPro',
                              fontSize: 23,
                            )),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          '${data?.wind}',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontFamily: 'MavenPro',
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text('19.1 km/h',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'MavenPro',
                              fontSize: 23,
                            )),
                        const SizedBox(height: 20),
                        Text(
                          'Last Update',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontFamily: 'MavenPro',
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text('${data?.last_update}',
                            style: const TextStyle(
                              color: Colors.green,
                              fontFamily: 'MavenPro',
                              fontSize: 14,
                            ))
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    ));
  }
}

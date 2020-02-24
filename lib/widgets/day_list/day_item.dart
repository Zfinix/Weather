import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:weather/utils/margin.dart';
import 'package:weather/viewmodels/weather_view_model.dart';

import 'day_list_item.dart';

class DayList extends StatelessWidget {
  final WeatherViewModel model;
  const DayList(this.model);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: screenHeight(context, percent: 0.64),
        width: screenWidth(context),
        child: model.weatherModel?.vlist?.length != null
            ? new Swiper(
                itemBuilder: (BuildContext context, int i) {
                  return DayListItem(
                      temp: '${model.weatherModel.vlist[i].temp.day}˚',
                      desc:
                          '${model.weatherModel.vlist[i].weather[0].description}',
                      condition: null,
                      endTemp: '${model.weatherModel.vlist[i].temp.max}',
                      startTemp: '${model.weatherModel.vlist[i].temp.min}',
                      text: '${model.weatherModel.vlist[i].weather[0].main}',
                      date: model.weatherModel.vlist[i].dt);
                },
                itemCount: model.weatherModel?.vlist?.length ?? 0,
                pagination: new SwiperPagination(
                    margin: EdgeInsets.only(top: 50),
                    builder: DotSwiperPaginationBuilder(
                        size: 4,
                        activeSize: 7,
                        color: Colors.grey[800],
                        activeColor: Colors.orange)),
              )
            : Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                  ],
                ),
                height: 30,
                width: 30,
              ),
        margin: EdgeInsets.symmetric(
          horizontal: 10,
        ));
  }
}

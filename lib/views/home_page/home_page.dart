import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider_architecture/viewmodel_provider.dart';
import 'package:weather/utils/margin.dart';
import 'package:weather/viewmodels/weather_view_model.dart';
import 'package:weather/widgets/day_list/day_item.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<WeatherViewModel>.withConsumer(
      viewModel: WeatherViewModel(),
      onModelReady: (model) => model.getWeather(),
      builder: (context, model, child) => Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: Container(),
        ),
        backgroundColor: Color(0xff1B1B1D),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          color: Colors.white,
                          height: 1.7,
                          width: 27,
                        ),
                        const YMargin(5),
                        Container(
                          color: Colors.white,
                          height: 1.7,
                          width: 18,
                        ),
                      ],
                    ),
                    onPressed: () {},
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {},

                          color: Colors.white,
                  ),
                ],
              ),
            ),
            const YMargin(50),
            Padding(
              padding: const EdgeInsets.all(15)
                  .add(EdgeInsets.symmetric(horizontal: 18.0)),
              child: Text('Enugu',
                  style: GoogleFonts.raleway(textStyle:TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.amber))),
            ),
            const YMargin(20),
            DayList(model),
          ],
        ),
      ),
    );
  }
}

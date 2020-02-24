import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather/utils/margin.dart';

class DayListItem extends StatelessWidget {
  final String temp, text, desc, startTemp, endTemp, condition;
  final num date;
  const DayListItem(
      {Key key,
      @required this.temp,
      @required this.text,
      @required this.desc,
      @required this.startTemp,
      @required this.endTemp,
      @required this.condition,
      @required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18.0)
          .add(EdgeInsets.only(bottom: 40)),
      decoration: BoxDecoration(
          color: Color(0xff0C0C0C), borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  temp ?? '',
                  style: GoogleFonts.raleway(textStyle:TextStyle(
                      fontSize: 70,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                )),
                const YMargin(10),
                Text(
                  text ?? '',
                  style: GoogleFonts.raleway(textStyle:TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                )),
                const YMargin(40),
                Container(
                  width: screenWidth(context, percent: 0.7),
                  child: Text(
                    desc ?? '',
                    style:GoogleFonts.raleway(textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        height: 1.5,
                        color: Colors.white.withOpacity(0.7)),
                  )),
                ),
                const YMargin(50),
                Text(
                  DateFormat('MMMMEEEEd').format(
                          DateTime.fromMillisecondsSinceEpoch(date * 1000)) ??
                      '',
                  style: GoogleFonts.raleway(textStyle:TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: Colors.white30),
                )),
                const YMargin(10),
              ],
            ),
          ),
          Spacer(),
          Container(
            color: Colors.grey[800].withOpacity(0.6),
            height: 0.5,
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: Row(
              children: <Widget>[
                Text(
                  '$startTemp˚ - $endTemp˚',
                  style: GoogleFonts.raleway(textStyle:TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.withOpacity(0.5)),
                )),
                Spacer(),
                Text(
                  '\uf086',
                  style: TextStyle(
                      fontSize: 29,
                      fontFamily: 'Weather',
                      fontWeight: FontWeight.w400,
                      color: Colors.red),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';
import 'dart:math' as math;

import 'data.dart';

class Booking extends StatefulWidget {
  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Movie Title'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(
                  height: 10,
                ),
                _buildDate(),
                SizedBox(
                  height: 10,
                ),
                _buildHour(),
                SizedBox(
                  height: 20,
                ),
                _buildLocation(),
                SizedBox(
                  height: 50,
                ),
                _buildAnimationScreen(),
                SizedBox(
                  height: 50,
                ),
                _buildContainerSeat()
              ]),
            ),
          ),
          _buildFooterButton(_size)
        ],
      ),
    );
  }

  Widget _buildContainerSeat() {
    return PlayAnimation<double>(
        tween: (0.0).tweenTo(1.0),
        duration: 200.milliseconds,
        delay: 600.milliseconds, //
        builder: (context, child, opacityValue) {
          return Opacity(
            opacity: opacityValue,
            child: Container(
                child: Column(
              children: <Widget>[
                _buildSeatList(),
                SizedBox(
                  height: 20,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: <Widget>[
                          _buildSeat(),
                          SizedBox(
                            width: 5,
                          ),
                          Text('Available')
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          _buildSeat(status: 1),
                          SizedBox(
                            width: 5,
                          ),
                          Text('Reserved')
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          _buildSeat(status: 2),
                          SizedBox(
                            width: 5,
                          ),
                          Text('Selected')
                        ],
                      )
                    ])
              ],
            )),
          );
        });
  }

  Row _buildSeatList() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Row(children: [_buildSeat(), _buildSeat(), _buildSeat()]),
          Row(children: [
            _buildSeat(),
            _buildSeat(),
            _buildSeat(),
            _buildSeat()
          ]),
          Row(children: [
            _buildSeat(),
            _buildSeat(),
            _buildSeat(),
            _buildSeat()
          ]),
          Row(children: [
            _buildSeat(),
            _buildSeat(status: 2),
            _buildSeat(status: 2),
            _buildSeat(status: 2)
          ]),
          Row(children: [
            _buildSeat(),
            _buildSeat(),
            _buildSeat(),
            _buildSeat()
          ]),
          Row(children: [
            _buildSeat(),
            _buildSeat(),
            _buildSeat(),
            _buildSeat()
          ]),
          Row(children: [_buildSeat(), _buildSeat(), _buildSeat()])
        ]),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [_buildSeat(), _buildSeat(), _buildSeat()]),
          Row(children: [
            _buildSeat(status: 1),
            _buildSeat(),
            _buildSeat(),
            _buildSeat()
          ]),
          Row(children: [
            _buildSeat(),
            _buildSeat(),
            _buildSeat(status: 1),
            _buildSeat(status: 1)
          ]),
          Row(children: [
            _buildSeat(status: 1),
            _buildSeat(),
            _buildSeat(),
            _buildSeat()
          ]),
          Row(children: [
            _buildSeat(),
            _buildSeat(),
            _buildSeat(),
            _buildSeat()
          ]),
          Row(children: [
            _buildSeat(),
            _buildSeat(),
            _buildSeat(),
            _buildSeat()
          ]),
          Row(children: [_buildSeat(), _buildSeat(), _buildSeat()])
        ])
      ],
    );
  }

  Container _buildSeat({int status = 0}) {
    Color _color;
    switch (status) {
      case 0:
        _color = Colors.transparent;
        break;
      case 1:
        _color = Colors.white;
        break;
      case 2:
        _color = Color(0xffFBB50B);
        break;
      default:
        _color = Colors.transparent;
    }
    return Container(
      margin: EdgeInsets.all(ScreenUtil().setWidth(10)),
      height: ScreenUtil().setWidth(40),
      width: ScreenUtil().setWidth(40),
      decoration: BoxDecoration(
          color: _color,
          border: Border.all(color: Color(0xff636365), width: 1)),
    );
  }

  Container _buildFooterButton(Size _size) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            width: _size.width / 2,
            padding: EdgeInsets.all(20),
            child: Center(
                child: Text(
              '\$30.0',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: ScreenUtil().setSp(40)),
            )),
          ),
          PlayAnimation<double>(
              tween: (0.0).tweenTo(1.0),
              duration: 200.milliseconds,
              delay: 1200.milliseconds, //
              curve: Curves.easeIn,
              builder: (context, child, scaleValue) {
                return Transform.scale(
                  scale: scaleValue,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(30)),
                        side: BorderSide(color: Colors.red)),
                    color: Color(0xffF02400),
                    padding: EdgeInsets.all(0),
                    onPressed: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(30))),
                      width: _size.width / 2,
                      padding: EdgeInsets.all(20),
                      child: Center(
                          child: Text('Pay',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: ScreenUtil().setSp(40)))),
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }

  Stack _buildAnimationScreen() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        _buildMovieScreen(),
        _buildImageLine(),
      ],
    );
  }

  Container _buildLocation() {
    return Container(
        child: Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 28, right: 15),
          child: Icon(Icons.movie),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('The Breeze BSD City',
                  style: TextStyle(
                    fontSize: 12,
                  )),
              SizedBox(
                height: 4,
              ),
              Text(
                'Jln. Grand Boulevard. BSD Green Office Park',
                style: TextStyle(fontSize: 11, color: Color(0xff616063)),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: <Widget>[
                  Text('2D',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                      )),
                  SizedBox(
                    width: 4,
                  ),
                  Text('3D',
                      style: TextStyle(fontSize: 11, color: Color(0xff616063))),
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 25, right: 25),
          child: Icon(Icons.arrow_forward_ios, size: ScreenUtil().setSp(30)),
        )
      ],
    ));
  }

  Widget _buildHour() {
    int indexSelected = 0;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.horizontal(left: Radius.circular(20)),
        // color: Colors.black,
      ),
      height: ScreenUtil().setWidth(130),
      width: ScreenUtil().setWidth(750),
      child: Padding(
        padding: EdgeInsets.only(top: 4.0, left: 4.0, bottom: 4.0),
        child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: hourList.length,
              itemBuilder: (contex, index) {
                Hour hour = hourList[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() => indexSelected = index);
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          left: ScreenUtil().setWidth(index == 0 ? 28 : 0)),
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(15)),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: index == indexSelected
                                  ? Color(0xff3D3423)
                                  : Colors.transparent,
                              width: index == indexSelected ? 2 : 0),
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              hour.title,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: index == indexSelected
                                      ? Color(0xffFAB313)
                                      : Colors.white),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              hour.subtitle,
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: index == indexSelected
                                      ? Color(0xff656567)
                                      : Color(0xff656567)),
                            )
                          ]),
                    ),
                  ),
                );
              });
        }),
      ),
    );
  }

  Align _buildDate() {
    int indexSelected = 4;
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.horizontal(left: Radius.circular(20))),
        height: ScreenUtil().setWidth(155),
        width: ScreenUtil().setWidth(705),
        child: Padding(
          padding: EdgeInsets.only(top: 4.0, left: 4.0, bottom: 4.0),
          child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dateList.length,
                itemBuilder: (contex, index) {
                  Date date = dateList[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() => indexSelected = index);
                      },
                      child: Container(
                        width: ScreenUtil().setWidth(70),
                        decoration: BoxDecoration(
                            color: index == indexSelected
                                ? Color(0xffFAB313)
                                : Colors.transparent,
                            borderRadius: BorderRadiusDirectional.circular(10)),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                date.title,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: index == indexSelected
                                        ? Colors.black
                                        : Colors.white),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                date.subtitle,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: index == indexSelected
                                        ? Colors.black
                                        : Color(0xff2E2D30)),
                              )
                            ]),
                      ),
                    ),
                  );
                });
          }),
        ),
      ),
    );
  }

  PlayAnimation<double> _buildMovieScreen() {
    return PlayAnimation<double>(
        tween: (0.0).tweenTo(1.0),
        duration: 200.milliseconds,
        delay: 1000.milliseconds, //
        builder: (context, child, scaleValue) {
          return Transform.scale(
            scale: scaleValue,
            child: Container(
              width: ScreenUtil().setWidth(500),
              child: PlayAnimation<double>(
                  tween: (5.0).tweenTo(30.0),
                  duration: 300.milliseconds,
                  delay: 1200.milliseconds, //
                  builder: (context, child, value) {
                    return Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Container(
                          height: 10,
                          width: 150,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 45.0),
                                blurRadius: 80.0,
                                spreadRadius: 5.0,
                              ),
                            ],
                          ),
                        ),
                        CustomPaint(
                          painter: CurvePainter(righCurved: value),
                          child: Center(
                            child: Container(
                              // height: 15,
                              width: 300,
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          );
        });
  }

  Widget _buildImageLine() {
    return PlayAnimation<double>(
        tween: (300.0).tweenTo(0.0),
        duration: 600.milliseconds,
        delay: 400.milliseconds, //
        builder: (context, child, valueHeigh) {
          return Container(
            height: valueHeigh,
            width: 350,
            alignment: Alignment.topCenter,
            child: PlayAnimation<double>(
                tween: (0.0).tweenTo(1.557),
                duration: 600.milliseconds,
                delay: 400.milliseconds, //
                builder: (context, child, value) {
                  return Hero(
                    tag: 'image',
                    child: Transform(
                      transform: Matrix4(
                        1,
                        0,
                        0,
                        0,
                        0,
                        1,
                        0,
                        0,
                        0,
                        0,
                        1,
                        0,
                        0,
                        0,
                        0,
                        1,
                      )..rotateX(value)
                      // ..rotateY(y)
                      // ..rotateZ(z)
                      ,
                      alignment: FractionalOffset.center,
                      child: Image.network(
                        'https://miro.medium.com/max/675/1*dFvbT2SWLo45t5qSTiYVyQ.jpeg',
                        fit: BoxFit.cover,
                        // width: 350,
                      ),
                    ),
                  );
                }),
          );
        });
  }
}

class CurvePainter extends CustomPainter {
  double righCurved;

  CurvePainter({this.righCurved});
  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromLTRB(20, 0, size.width - 20, righCurved);
    final startAngle = -math.pi;
    final sweepAngle = math.pi;
    final useCenter = false;
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

import 'package:flutter/material.dart';

import 'booking.dart';

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          
          title: Text('Movie Detail'),
          backgroundColor: Colors.black
        ),
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return RadialGradient(
                  center: Alignment.bottomCenter,
                  radius: 2.0,
                  colors: <Color>[
                    Colors.black,
                    Colors.black,
                    Theme.of(context).scaffoldBackgroundColor,
                    Colors.white
                  ],
                  tileMode: TileMode.clamp,
                ).createShader(bounds);
              },
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://miro.medium.com/max/675/1*dFvbT2SWLo45t5qSTiYVyQ.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Image.network(
                      //   'https://miro.medium.com/max/675/1*dFvbT2SWLo45t5qSTiYVyQ.jpeg',
                      //   height: 200,
                      // ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'RUMBLE',
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Rumble (2021 film) Rumble is an upcoming American computer-animated sports comedy film directed by Hamish Grieve',
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('2021'),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            height: 5,
                            width: 5,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                          ),
                          Text('Paramount Pictures'),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            height: 5,
                            width: 5,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                          ),
                          Text('English'),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: BorderSide(color: Colors.red)),
                          color: Color(0xffE82302),
                          child: Text('BUY TICKET'),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (contex) => Booking()));
                          }),

                      SizedBox(
                        height: 40,
                      ),
                      Hero(
                        tag: 'image',
                        child: Image.network(
                          'https://miro.medium.com/max/675/1*dFvbT2SWLo45t5qSTiYVyQ.jpeg',
                          height: 200,
                        ),
                      ),
                      // Align(
                      //     alignment: Alignment.bottomRight,
                      //     child: )
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

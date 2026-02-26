import 'package:flutter/material.dart';
import 'package:animations/models/trip.dart';
import 'package:animations/shared/heart.dart';

class Details extends StatelessWidget {
  final Trip trip;
  Details({required this.trip});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      extendBodyBehindAppBar: true,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ClipRRect(
              child: Image.asset(
                'images/${trip.img}',
                height: 360,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
            SizedBox(height: 30),
            ListTile(
              title: Text(
                trip.title!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey[800],
                ),
              ),
              subtitle: Text(
                '${trip.nights} night stay for only \$${trip.price}',
                style: TextStyle(letterSpacing: 1),
              ),
              trailing: Heart(),
            ),
            Padding(
              padding: EdgeInsets.all(18),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent nec mattis nisi, at euismod enim. Nulla nibh ipsum, elementum at leo vel, tempus elementum velit. Cras a arcu non sapien tristique commodo. Maecenas vel tempor leo. Morbi ac arcu a sem maximus laoreet. Fusce ac congue nisi. Fusce eu justo sit amet massa ornare rhoncus. Ut sagittis malesuada nibh, sed finibus risus facilisis eu. Etiam lobortis, diam id bibendum efficitur, arcu elit pellentesque nunc, vulputate accumsan dui est ut purus. Integer ornare eget augue in posuere. Vivamus pharetra purus vel diam efficitur, non ornare tellus tristique. Nunc pharetra nulla libero, sed gravida turpis pharetra in. Morbi quis ligula eleifend diam semper consequat. Vivamus tincidunt ligula sem, ac hendrerit dui lobortis consectetur. Mauris nunc lorem, hendrerit volutpat volutpat quis, faucibus sed diam. Nam scelerisque massa sem, at blandit neque molestie vel.",
                style: TextStyle(color: Colors.grey[600], height: 1.4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

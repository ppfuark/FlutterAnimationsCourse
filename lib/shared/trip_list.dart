import 'dart:async';

import 'package:flutter/material.dart';
import 'package:animations/models/trip.dart';
import 'package:animations/screens/details.dart';

class TripList extends StatefulWidget {
  const TripList({super.key});

  @override
  State<TripList> createState() => _TripListState();
}

class _TripListState extends State<TripList> {
  final List<Widget> tripTiles = [];
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      addTrips();
    });
  }

  void addTrips() {
    // get data from db
    List<Trip> trips = [
      Trip(
        title: 'Beach Paradise',
        price: '350',
        nights: '3',
        img: 'beach.png',
      ),
      Trip(title: 'City Break', price: '400', nights: '5', img: 'city.png'),
      Trip(title: 'Ski Adventure', price: '750', nights: '2', img: 'ski.png'),
      Trip(title: 'Space Blast', price: '600', nights: '4', img: 'space.png'),
    ];

    Future future = Future(() {});

    for (var trip in trips) {
      future = future.then((_) {
        return Future.delayed(Duration(milliseconds: 100), () {
          tripTiles.add(buildTile(trip));
          listKey.currentState?.insertItem(tripTiles.length - 1);
        });
      });
    }
  }

  Widget buildTile(Trip trip) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Details(trip: trip)),
        );
      },
      contentPadding: EdgeInsets.all(25),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '${trip.nights} nights',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.blue[300],
            ),
          ),
          Text(
            trip.title!,
            style: TextStyle(fontSize: 20, color: Colors.grey[600]),
          ),
        ],
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Hero(
          tag: trip.img!,
          child: Image.asset('images/${trip.img}', height: 50.0),
        ),
      ),
      trailing: Text('\$${trip.price}'),
    );
  }

  Tween<Offset> offset = Tween(begin: Offset(1, 0), end: Offset(0, 0));

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: listKey,
      initialItemCount: tripTiles.length,
      itemBuilder: (context, index, animation) {
        return SlideTransition(
          position: animation.drive(offset),
          child: tripTiles[index],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';

class Sandbox extends StatefulWidget {
  const Sandbox({super.key});

  @override
  State<Sandbox> createState() => _SandboxState();
}

class _SandboxState extends State<Sandbox> {
  double opacity = 1;
  double w = 200;
  double margin = 0;
  Color color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(seconds: 1),
        margin: EdgeInsets.all(margin),
        width: w,
        color: color,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("animate margin"),
              onPressed: () {
                setState(() {
                  margin = 50;
                });
              },
            ),
            ElevatedButton(
              child: Text("animate color"),
              onPressed: () {
                setState(() {
                  color = Colors.deepPurpleAccent;
                });
              },
            ),
            ElevatedButton(
              child: Text("animate width"),
              onPressed: () {
                setState(() {
                  w = 300;
                });
              },
            ),
            ElevatedButton(
              child: Text("animate opacity"),
              onPressed: () {
                setState(() {
                  opacity = 0;
                });
              },
            ),
            AnimatedOpacity(
              opacity: opacity,
              duration: Duration(seconds: 1),
              child: Text("Hide me", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

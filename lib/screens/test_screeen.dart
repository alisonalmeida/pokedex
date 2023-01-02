import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TestWidg extends StatefulWidget {
  const TestWidg({super.key});

  @override
  State<TestWidg> createState() => _TestWidgState();
}

class _TestWidgState extends State<TestWidg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DefaultTabController(
          length: 3,
          child: SizedBox(
            height: 50,
            width: 50,
            child: Column(
              children: [
                TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.flight)),
                    Tab(icon: Icon(Icons.directions_transit)),
                    Tab(icon: Icon(Icons.directions_car)),
                  ],
                ),
                TabBarView(
                  children: [
                    Icon(Icons.flight, size: 350),
                    Icon(Icons.directions_transit, size: 350),
                    Icon(Icons.directions_car, size: 350),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

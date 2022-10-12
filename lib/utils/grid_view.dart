import 'package:flutter/material.dart';

class MyGridView extends StatefulWidget {
  const MyGridView({super.key, this.title});

  final String? title;

  @override
  State<MyGridView> createState() => _MyGridViewState();
}

class _MyGridViewState extends State<MyGridView> {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: UniqueKey(),
      body: GridView.builder(
        itemCount: 20,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(1.0),
            child: Container(
              color: Colors.black,
            ),
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: (size.height > size.width) ? 4 : 6,
          childAspectRatio: 1/2
        ),

      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

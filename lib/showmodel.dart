import 'package:flutter/material.dart';

class Showmodel extends StatelessWidget {
  const Showmodel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                
              );
            });
      },
      child: Text('Tab me'),
    );
  }
}

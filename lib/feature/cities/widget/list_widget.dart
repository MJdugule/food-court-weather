import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CitiesWidget extends StatelessWidget {
  const CitiesWidget({super.key, required this.name});
final String name;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        
      },
      title: Text(name),
    );
  }
}
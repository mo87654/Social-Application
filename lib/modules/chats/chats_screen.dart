import 'package:flutter/material.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('ChatsScreen',
      style: Theme.of(context).textTheme.headlineLarge,),);
  }
}

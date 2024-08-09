
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('add new address'),
      ),
      body: Container(
        child: Text('add new address'),
      ));
        
  }
}
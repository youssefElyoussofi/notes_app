import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_appbar.dart';

class CustomBody extends StatelessWidget {
  const CustomBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        CustomAppbar()
      ],),
    );
  }
}
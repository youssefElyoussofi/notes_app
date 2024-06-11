import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_search_icon.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key, required this.title, required this.icon, this.onPressed});

  final String title;
  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Row(
        children: [
          Text(title,style: const TextStyle(fontSize: 28),),
          const Spacer(),
           CustomSearchBar(icon: icon,onPressed: onPressed,)
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';

class Styledtext extends StatelessWidget {
  const Styledtext(this.customtext, {super.key});

  final String customtext;
  @override
  Widget build(BuildContext context) {
    return Text(
      customtext,
      style: const TextStyle(fontWeight: FontWeight.bold),
      textAlign: TextAlign.start,
    );
  }
}

class StyledField extends StatelessWidget {
  const StyledField({super.key,});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 40,
      child: TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(
          borderSide: BorderSide(width: 1.0),
        )),
      ),
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.elevatedtext,
    required this.onTap,
  });

  final String elevatedtext;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black87,
        minimumSize: const Size(300, 60),
        padding: const EdgeInsets.all(10),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      onPressed: onTap,
      child: Text(
        elevatedtext,
        style: const TextStyle(
            color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class PortaElevatedButton extends StatelessWidget {
  const PortaElevatedButton({
    super.key,
    required this.elevatedtext,
    required this.onTap,
  });

  final String elevatedtext;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: Colors.white,
          ),
          child: Text(
            elevatedtext,
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}

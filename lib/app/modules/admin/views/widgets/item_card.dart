import 'package:flutter/material.dart';

class ItemCardWidget extends StatelessWidget {
  const ItemCardWidget({
    Key? key,
    required this.icn,
    required this.title,
    required this.function,
  }) : super(key: key);
  final IconData icn;
  final String title;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ElevatedButton(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.black),
            backgroundColor: MaterialStateProperty.all(Colors.white),
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)))),
        onPressed: () {
          function();
          // Navigator.push(context,
          //     PageTransition(child: wg, type: PageTransitionType.fade));
        },
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width / 3.3,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Icon(icn),
                const SizedBox(
                  height: 15,
                ),
                Text(title),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

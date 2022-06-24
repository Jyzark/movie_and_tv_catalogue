import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  const Section({
    Key? key,
    required this.sectionTitle,
    required this.sectionSubtitle,
  }) : super(key: key);

  final String sectionTitle;
  final String sectionSubtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              sectionTitle,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const Spacer(),
            TextButton(onPressed: () {}, child: const Text('View All'))
          ],
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 1.5,
          child: Text(sectionSubtitle),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

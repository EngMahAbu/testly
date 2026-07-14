import 'package:flutter/material.dart';

class SubjectCard extends StatelessWidget {
  const SubjectCard({
    super.key,
    required this.subject,
    required this.subjectImg,
  });
  final String subject;
  final String subjectImg;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: const Color(0xffF9F9F9),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color(0x402A2929),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 24),
          SizedBox(
            width: 40,
            height: 40,
            child: Image.network(
              subjectImg,
              fit: BoxFit.contain,
              errorBuilder: (_, _, _) => const Icon(Icons.broken_image),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(subject, maxLines: 1, overflow: TextOverflow.ellipsis),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FaqWidget extends StatelessWidget {
  FaqWidget({super.key});

  final List<Map<String, String>> faqItems = [
    {
      'question': 'What types of wedding invitations are available?',
      'answer':
          'We offer a wide range of wedding invitations including Digital Invites, Printed Invites, Video Invites, and Theme-Based Invites. Each category includes various styles like Save the Date, Main Invitations, RSVP, Wedding Programs, and more, designed to suit different tastes and preferences.'
    },
    {'question': 'Can I customize the wedding invitations?', 'answer': ''},
    {
      'question':
          'How do I preview my wedding invitation before finalizing it?',
      'answer': ''
    },
    {
      'question': 'Can I send digital invitations directly from the app?',
      'answer': ''
    },
    {
      'question': 'Is there an option to order printed invitations?',
      'answer': ''
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: faqItems.map((faqItem) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.transparent,
              ),
              child: ExpansionTile(
                childrenPadding: EdgeInsets.zero,
                iconColor: Colors.black54,
                tilePadding:
                    EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
                textColor: Colors.black,
                title: Text(
                  faqItem['question']!,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
                children: [
                  Padding(
                    padding: EdgeInsets.all(15.0.r),
                    child: Text(
                      faqItem['answer']!,
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(fontSize: 14.sp),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

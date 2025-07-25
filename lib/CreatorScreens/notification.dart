import 'package:buddy/res/contants/colors_contants.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final NotificationPages = [
      {
        'title': 'Reel Successfully Uploaded by',
        'user': 'John Delto',
        'message': '',
      },
      {
        'title': 'Payment Approved Successfully',
        'user': '',
        'message':
            '"Thank you for confirming the reel upload". ₹202 has been transferred to John.',
      },
      {
        'title': 'Reel Approval Denied by team/jury',
        'user': '',
        'message': 'Reason: The creator will review the reel and re-upload.',
      },
      {
        'title': 'Reel Successfully Uploaded by',
        'user': 'John Delto',
        'message': '',
      },
    ];

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            children: [
              // Custom heading
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'NotificationPage',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: ColorsContants.primaryColor,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // Notification list
              Expanded(
                child: ListView.separated(
                  itemCount: NotificationPages.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final item = NotificationPages[index];
                    return Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          )
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage:
                                AssetImage('assets/avature.png'), // Your asset
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  maxLines: 1,
                                  '${item['title']} ${item['user']}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: ColorsContants.textColor,
                                  ),
                                ),
                                if (item['message'] != '')
                                  Padding(
                                    padding: const EdgeInsets.only(top: 6.0),
                                    child: Text(
                                      maxLines: 2,
                                      item['message']!,
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: ColorsContants.textColor,
                                      ),
                                    ),
                                  ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    _ActionButton(
                                      text: 'Approved',
                                      color: const Color.fromARGB(
                                          255, 44, 233, 50),
                                    ),
                                    const SizedBox(width: 8),
                                    _ActionButton(
                                      text: 'Deny',
                                      color: const Color.fromARGB(
                                          255, 239, 34, 34),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String text;
  final Color color;

  const _ActionButton({
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 30,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

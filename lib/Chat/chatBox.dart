import 'package:buddy/res/contants/colors_contants.dart';
import 'package:flutter/material.dart';

class ChatBox extends StatefulWidget {
  @override
  _ChatBoxState createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  // List of sample messages with sender info
  List<Map<String, String>> messages = [
    {'sender': 'Receiver', 'message': 'Hello! How are you?'},
    {'sender': 'Sender', 'message': 'I am good, thanks! How about you?'},
    {'sender': 'Receiver', 'message': 'I am doing well!'},
    {
      'sender': 'Sender',
      'message':
          'This is a longer message to test the resizing of the message box.'
    },
  ];

  // Controller for the message input field
  TextEditingController messageController = TextEditingController();

  // Function to add a message to the list
  void sendMessage() {
    if (messageController.text.isNotEmpty) {
      setState(() {
        messages.add({
          'sender': 'Sender',
          'message': messageController.text,
        });
      });
      messageController.clear(); // Clear the text field after sending
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Messages",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: ColorsContants.primaryColor,
          ),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: Column(
        children: [
          // List of messages
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isSender = message['sender'] == 'Sender';

                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: isSender
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      // Profile Avatar for receiver (on the left)
                      if (!isSender)
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.grey,
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ),
                      const SizedBox(width: 8),

                      // Message Bubble
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth:
                              250, // Limit the max width of the message box
                        ),
                        child: Material(
                          color: isSender
                              ? Colors.green[500]! // Sender: green
                              : Colors.grey[300]!, // Receiver: gray
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                            bottomLeft: isSender
                                ? Radius.circular(12)
                                : Radius.circular(0),
                            bottomRight: isSender
                                ? Radius.circular(0)
                                : Radius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              message['message']!,
                              style: TextStyle(
                                color: isSender ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 8),

                      // Profile Avatar for sender (on the right)
                      if (isSender)
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.grey,
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Text input and send button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                // Green Circle with Upward Arrow Icon
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green, // Green background
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.keyboard_arrow_up_sharp,
                        size: 35.0, color: Colors.white),
                    onPressed: sendMessage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

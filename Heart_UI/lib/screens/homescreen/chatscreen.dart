import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, String>> _messages = []; // List to store chat messages
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
       
        _messages.add({'sender': 'You', 'message': _messageController.text});

       
        String response = _generateResponse(_messageController.text);
        if (response.isNotEmpty) {
          _messages.add({'sender': 'Bot', 'message': response});
        }

        _messageController.clear(); 
      });

     
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent + 50,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  String _generateResponse(String message) {
    if (message.toLowerCase().contains('fever') ||
        message.toLowerCase().contains('cough')) {
      return 'It seems like you might have flu or cold. Consider visiting a healthcare provider if symptoms persist.';
    } else if (message.toLowerCase().contains('headache')) {
      return 'Headaches can have various causes. Ensure you are hydrated and rested. If headaches persist, seek medical advice.';
    } else if (message.toLowerCase().contains('pain')) {
      return 'Please provide more details about the type and location of pain. This will help in determining the possible causes.';
    } else {
      return 'I am not sure about this symptom. Can you please provide more details or consult a healthcare professional.';
    }
  }

  Future<bool> _onWillPop() async {
    Navigator.pushReplacementNamed(context, '/home');
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Health Chat'),
          backgroundColor: const Color(0xFF1259e4),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  bool isUser = _messages[index]['sender'] == 'You';
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    child: Align(
                      alignment:
                          isUser ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: isUser ? Colors.blue[200] : Colors.grey[300],
                          borderRadius: isUser
                              ? const BorderRadius.only(
                                  topLeft: Radius.circular(15.0),
                                  bottomLeft: Radius.circular(15.0),
                                  bottomRight: Radius.circular(15.0),
                                )
                              : const BorderRadius.only(
                                  topRight: Radius.circular(15.0),
                                  bottomLeft: Radius.circular(15.0),
                                  bottomRight: Radius.circular(15.0),
                                ),
                        ),
                        child: Text(
                          _messages[index]['message']!,
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: 'Type your symptoms...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onSubmitted: (value) {
                        _sendMessage();
                      },
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  IconButton(
                    icon: const Icon(Icons.send, color: Color(0xFF1259e4)),
                    onPressed: _sendMessage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

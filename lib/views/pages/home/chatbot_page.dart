import 'package:flutter/material.dart';
import 'package:waste_management_app/components/form_fields.dart';
import 'package:waste_management_app/resources/app_colors.dart';
import 'package:waste_management_app/resources/app_page.dart';
import 'package:waste_management_app/resources/app_strings.dart';
import 'package:waste_management_app/views/pages/home/components/chatbot_data.dart';

class ChatbotPage extends StatefulWidget {
  const ChatbotPage({super.key});

  @override
  State<ChatbotPage> createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  final TextEditingController messageController = TextEditingController();
  List<Map<String, String>> messages = [];

  @override
  void initState() {
    super.initState();
    messages.add({'bot': "Hi, I'm EcoBot 🤖. How can i assist you today?"});
  }

  void sendMessage(String message) {
    setState(() {
      messages.add({'user': message});
      String botResponse = getBotResponse(message);
      messages.add({'bot': botResponse});
    });
    messageController.clear();
  }

  String getBotResponse(String message) {
    for (var key in chatbotResponses.keys) {
      if (message.toLowerCase().contains(key)) {
        return chatbotResponses[key] ?? '';
      }
    }
    return chatbotResponses['default'] ??
        "I'm not sure about that. Could you rephrase?";
  }

  @override
  Widget build(BuildContext context) {
    return AppPageSecondary(
      title: AppStrings.chatWithSupport,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                var entry = messages[index];
                bool isUser = entry.containsKey('user');
                return Align(
                  alignment:
                      isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Padding(
                    padding: isUser
                        ? const EdgeInsets.only(left: 50)
                        : const EdgeInsets.only(right: 50),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color:
                            isUser ? AppColors.primaryColor : Colors.grey[700],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        entry.values.first,
                        style: const TextStyle(color: AppColors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8,
              top: 10,
            ),
            child: Row(
              children: [
                Expanded(
                  child: PrimaryTextFormField(
                    controller: messageController,
                    borderRadius: 25,
                    focusedBorderRadius: 25,
                    enabledBorderRadius: 25,
                    bottomPadding: 0.0,
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.sentences,
                  ),
                ),
                const SizedBox(width: 6),
                Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.green[100], shape: BoxShape.circle),
                    child: IconButton(
                      onPressed: () {
                        if (messageController.text.isNotEmpty) {
                          sendMessage(messageController.text);
                        }
                      },
                      icon: const Icon(
                        Icons.send_rounded,
                        color: AppColors.primaryColor,
                      ),
                    ),
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

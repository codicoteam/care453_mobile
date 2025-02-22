import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/features/message_management/screens/group_detail_dialog.dart';
import 'package:care453/widgets/customer_animation/leftbounce_animation.dart';
import 'package:care453/widgets/customer_animation/rightbounce_animation.dart';
import 'package:care453/widgets/loaders/loader_group_user.dart';
import 'package:care453/widgets/loaders/loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/utils/asset_utils/image_util.dart';
import '../controller/chat_controller.dart';
import 'package:intl/intl.dart';

import '../helpers/message_helpers.dart';

class ChatScreen extends StatelessWidget {
  final ChatController chatController = Get.put(ChatController());
                           
  final String groupId;
  final String userId;
  final String fullName;


  ChatScreen({required this.groupId, required this.userId, required this.fullName}) {
    chatController.connectSocket(userId, groupId);
    chatController.getUsersInGroup(groupId: groupId);
  }
  final ChatHelpers _chatHelpers = ChatHelpers();

  String _formatTimestamp(String timestamp) {
    try {
      DateTime date = DateTime.parse(timestamp); // Parse the timestamp
      return DateFormat('EEE, MMM d, yyyy').format(date); // Format the date
    } catch (e) {
      return 'Invalid date'; // Handle parsing errors
    }
  }

  String FormatTimeInTimeStamp(String timestamp) {
    try {
      DateTime date = DateTime.parse(timestamp); // Parse the timestamp
      return DateFormat('HH:mm:ss').format(date); // Format to time only
    } catch (e) {
      return 'Invalid time'; // Handle parsing errors
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Pallete.whiteColor,
            size: 28,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My Chat',
              style: GoogleFonts.poppins(
                color: Pallete.whiteColor,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            Obx(() {
              // Check if loading state is true
              if (chatController.isLoadingUser.value) {
                return LoaderGroupUser();
              }

              return Column(
                children: [
                  if (chatController.typingUserId.value.isNotEmpty)
                    Text(
                      '${chatController.typingUserId.value} is typing...',
                      style: GoogleFonts.poppins(
                        color: Pallete.whiteColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  if (chatController.typingUserId.value.isEmpty)
                    // Wrap ListView.separated in a constrained widget
                    SizedBox(
                      height: 30, // Set a fixed height
                      child: ListView.separated(
                        padding: const EdgeInsets.all(0),
                        scrollDirection: Axis.horizontal, // Horizontal scroll
                        itemCount: chatController.usersInGroup.length > 2
                            ? 2
                            : chatController.usersInGroup.length,
                        separatorBuilder: (_, __) =>
                            const SizedBox(width: 12), // Horizontal spacing
                        itemBuilder: (context, index) {
                          final user = chatController.usersInGroup[index];

                          return Text(
                            "${user.firstName} ${user.lastName},",
                            style: GoogleFonts.poppins(
                              color: Pallete.whiteColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          );
                        },
                      ),
                    ),
                ],
              );
            }),
          ],
        ),
        flexibleSpace: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(LocalImageConstants.care_giver_two),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              color: Pallete.originBlue
                  .withOpacity(0.9), // Blue overlay with 50% opacity
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.dialog(
                    GroupDetailDialog(users: chatController.usersInGroup));
              },
              icon: Icon(
                Icons.info,
                size: 30,
                color: Pallete.whiteColor,
              ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () {
                if (chatController.isLoading.value) {
                  return const Center(
                    child:
                        VehicleLoader(), // Display loader while loading
                  );
                }
                return ListView.builder(
                  reverse: true,
                  itemCount: chatController.messages.length,
                  itemBuilder: (context, index) {
                    final reversedMessages =
                        chatController.messages.reversed.toList();
                    final message = reversedMessages[index];
                    final senderId = message['senderId'].toString();
                    final imageUrl = message['images'];
                    final messageText = message['message']?.toString();
                    if (senderId == "$userId") {
                      return BounceFromRightAnimation(
                        delay: 2.0,
                        child: ChatBubble(
                          clipper: senderId == "$userId"
                              ? ChatBubbleClipper9(type: BubbleType.sendBubble)
                              : ChatBubbleClipper10(
                                  type: BubbleType.receiverBubble),
                          alignment: senderId == "$userId"
                              ? Alignment.topRight
                              : Alignment.topLeft,
                          margin: EdgeInsets.only(top: 10),
                          backGroundColor: senderId == "$userId"
                              ? Pallete.originBlue
                              : Color(0xffE7E7ED),
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.7,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(3),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        message['first_name'] ?? 'Unknown',
                                        style: GoogleFonts.poppins(
                                          color: senderId == "$userId"
                                              ? Pallete.whiteColor
                                              : Pallete.blackColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        _formatTimestamp(
                                            message['timestamp'] ?? 'Date'),
                                        style: GoogleFonts.poppins(
                                          color: senderId == "$userId"
                                              ? Pallete.whiteColor
                                              : Pallete.lightPrimaryTextColor,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1,
                                    child: Container(
                                      color: Pallete.whiteColor.withOpacity(0.6),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  if (imageUrl != null &&
                                      imageUrl != 'http://placeholder/image')
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 13.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12.0),
                                        child: Image.network(
                                          imageUrl,
                                          width:
                                              MediaQuery.of(context).size.width *
                                                  0.6,
                                          fit: BoxFit.cover,
                                          loadingBuilder:
                                              (context, child, progress) {
                                            return progress == null
                                                ? child
                                                : Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                      value: progress
                                                                  .expectedTotalBytes !=
                                                              null
                                                          ? progress
                                                                  .cumulativeBytesLoaded /
                                                              progress
                                                                  .expectedTotalBytes!
                                                          : null,
                                                    ),
                                                  );
                                          },
                                        ),
                                      ),
                                    ),
                                  if (messageText != null &&
                                      messageText != 'no caption')
                                    Text(
                                      messageText,
                                      style: GoogleFonts.poppins(
                                        color: senderId == "$userId"
                                            ? Pallete.whiteColor
                                            : Pallete.blackColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        FormatTimeInTimeStamp(
                                            message['timestamp'] ?? 'Date'),
                                        style: GoogleFonts.poppins(
                                          color: senderId == "$userId"
                                              ? Pallete.whiteColor
                                              : Pallete.lightPrimaryTextColor,
                                          fontSize: 9,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      SizedBox(width: 20),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return BounceFromLeftAnimation(
                        delay: 2.0,
                        child: ChatBubble(
                          clipper: senderId == "$userId"
                              ? ChatBubbleClipper9(type: BubbleType.sendBubble)
                              : ChatBubbleClipper10(
                                  type: BubbleType.receiverBubble),
                          alignment: senderId == "$userId"
                              ? Alignment.topRight
                              : Alignment.topLeft,
                          margin: EdgeInsets.only(top: 10),
                          backGroundColor: senderId == "$userId"
                              ? Pallete.originBlue
                              : Color(0xffE7E7ED),
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.7,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(3),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        message['first_name'] ?? 'Unknown',
                                        style: GoogleFonts.poppins(
                                          color: senderId == "$userId"
                                              ? Pallete.whiteColor
                                              : Pallete.blackColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        _formatTimestamp(
                                            message['timestamp'] ?? 'Date'),
                                        style: GoogleFonts.poppins(
                                          color: senderId == "$userId"
                                              ? Pallete.whiteColor
                                              : Pallete.lightPrimaryTextColor,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1,
                                    child: Container(
                                      color:
                                          Pallete.whiteColor.withOpacity(0.6),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  if (imageUrl != null &&
                                      imageUrl != 'http://placeholder/image')
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 13.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        child: Image.network(
                                          imageUrl,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.6,
                                          fit: BoxFit.cover,
                                          loadingBuilder:
                                              (context, child, progress) {
                                            return progress == null
                                                ? child
                                                : Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                      value: progress
                                                                  .expectedTotalBytes !=
                                                              null
                                                          ? progress
                                                                  .cumulativeBytesLoaded /
                                                              progress
                                                                  .expectedTotalBytes!
                                                          : null,
                                                    ),
                                                  );
                                          },
                                        ),
                                      ),
                                    ),
                                  if (messageText != null &&
                                      messageText != 'no caption')
                                    Text(
                                      messageText,
                                      style: GoogleFonts.poppins(
                                        color: senderId == "$userId"
                                            ? Pallete.whiteColor
                                            : Pallete.blackColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        FormatTimeInTimeStamp(
                                            message['timestamp'] ?? 'Date'),
                                        style: GoogleFonts.poppins(
                                          color: senderId == "$userId"
                                              ? Pallete.whiteColor
                                              : Pallete.lightPrimaryTextColor,
                                          fontSize: 9,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      SizedBox(width: 20),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.photo, color: Pallete.originBlue),
                  onPressed: () => _chatHelpers.sendImage(
                    groupId: groupId,
                    userId: userId,
                    firstName: fullName,
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: chatController.messageController,
                    onChanged: (text) =>
                        chatController.notifyTyping(groupId, fullName),
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.send,
                    color: Pallete.originBlue,
                  ),
                  onPressed: () {
                    String timestamp = DateTime.now()
                        .toUtc()
                        .toIso8601String(); // Generate the timestamp
                    chatController.sendMessage(
                      groupId: groupId,
                      userId: userId,
                      firstName: fullName,
                      timestamp: timestamp,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


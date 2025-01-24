import 'package:care453/core/utils/logs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../../models/group_users_models.dart';
import '../services/group_user_service.dart';

class ChatController extends GetxController {
  final TextEditingController messageController = TextEditingController();
  final RxList<Map<String, dynamic>> messages = <Map<String, dynamic>>[].obs;
  final RxString typingUserId = ''.obs;
  final RxBool isLoading = true.obs; // Add isLoading state
  late IO.Socket socket;

  void connectSocket(String userId, String groupId) {
    socket = IO.io(
      'https://care-give-backend.onrender.com',
      IO.OptionBuilder()
          .setTransports(['websocket']).setQuery({'userId': userId}).build(),
    );

    socket.onConnect((_) {
      print('Connected to socket');
      joinGroup(groupId, userId);
    });

    socket.on('newMessage', (data) {
      messages.add(data); // Adds the new message to the end of the list
    });

    socket.on('typing', (senderId) {
      typingUserId.value = senderId;
      Future.delayed(Duration(seconds: 2), () {
        if (typingUserId.value == senderId) typingUserId.value = '';
      });
    });
  }

  void joinGroup(String groupId, String userId) {
    socket.emit('joinGroup', {'userId': userId, 'groupId': groupId});
    isLoading.value = true; // Start loading
    socket.on('groupMessages', (data) {
      messages.value = List<Map<String, dynamic>>.from(data);
      isLoading.value = false; // Stop loading after messages are loaded
    });
  }

  void sendMessage({
    required String groupId,
    required String userId,
    required String firstName,
    required String timestamp,
    String? imageUrl,
    String? caption,
  }) {
    final messageText = messageController.text.trim();
    final messageContent = caption?.isNotEmpty == true
        ? caption
        : (messageText.isNotEmpty ? messageText : 'no caption');

    if (messageContent!.isNotEmpty || imageUrl != null) {
      socket.emit('message', {
        'groupId': groupId,
        'senderId': userId,
        'message': messageContent,
        'first_name': firstName,
        'timestamp': timestamp,
        'images': imageUrl ?? 'http://placeholder/image',
      });
      DevLogs.logSuccess(groupId);
      messageController.clear();
    }
  }

  void notifyTyping(String groupId, String userId) {
    socket.emit('typing', {'groupId': groupId, 'senderId': userId});
  }

  @override
  void onClose() {
    socket.dispose();
    super.onClose();
  }

  var isLoadingUser = false.obs;
  var successMessage = ''.obs;
  var errorMessage = ''.obs;

  // Observable list for fetched trips
  var usersInGroup = <GroupUser>[].obs;
  var userInGroup = Rxn<GroupUser>();
  Future<void> getUsersInGroup({required String groupId}) async {
    try {
      isLoadingUser(true); // Start loading
      final response =
          await GroupUserService.fetchUsersInGroup(groupId: groupId);
      if (response.success) {
        isLoadingUser(false);
        usersInGroup.value = response.data ?? [];
        successMessage.value = response.message ?? 'Users loaded successfully';
      } else {
        isLoadingUser(false);

        errorMessage.value = response.message!;
      }
    } catch (e) {
      isLoadingUser(false);

      DevLogs.logError('Error fetching users: ${e.toString()}');
      errorMessage.value =
          'An error occurred while fetching users: ${e.toString()}';
    } finally {
      isLoading(false); // End loading
    }
  }
}

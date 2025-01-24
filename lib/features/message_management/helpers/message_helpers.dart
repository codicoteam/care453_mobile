import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../widgets/custom_description.dart';
import '../../../widgets/custom_loader.dart';
import '../controller/chat_controller.dart';

class ChatHelpers {
  final ImagePicker imagePicker = ImagePicker();
  final ChatController chatController = Get.put(ChatController());

  void sendMessage({
    required TextEditingController controller,
    required List<Map<String, dynamic>> messages,
    required Function(List<Map<String, dynamic>>) updateMessages,
  }) {
    if (controller.text.isNotEmpty) {
      messages.add({'type': 'text', 'content': controller.text});
      updateMessages(
          List<Map<String, dynamic>>.from(messages)); // Ensure a fresh copy
      controller.clear();
    }
  }



Future<void> sendImage({
  required String groupId,
  required String userId,
  required String firstName,
}) async {
  final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
  if (pickedImage != null) {
    final captionController = TextEditingController();
    Get.dialog(
      Dialog(
        alignment: Alignment.bottomCenter,
        insetPadding: EdgeInsets.zero,
        shadowColor: Colors.grey.withOpacity(0.2),
        child: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 10,
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.file(
                  File(pickedImage.path),
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      controller: captionController,
                      decoration: InputDecoration(
                        hintText: 'Enter Caption',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send, color: Colors.blueAccent),
                    onPressed: () async {
                      showLoadingDialog();
                      try {
                        final uploadedUrls = await uploadImagesToSupabase(
                          [pickedImage],
                        );
                        if (uploadedUrls.isNotEmpty) {
                          final imageUrl = uploadedUrls.first;
                          final timestamp =
                              DateTime.now().toUtc().toIso8601String();
                          chatController.sendMessage(
                            groupId: groupId,
                            userId: userId,
                            firstName: firstName,
                            timestamp: timestamp,
                            imageUrl: imageUrl,
                            caption: captionController.text.trim(),
                          );
                        } else {
                          throw Exception('Image upload failed.');
                        }
                      } catch (e) {
                        print('Error: $e');
                        Get.snackbar('Error', 'Failed to upload image.');
                      } finally {
                        Get.back(); // Close dialogs
                        Get.back();
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}




  void showLoadingDialog() {
    Get.dialog(
      CustomLoader(message: 'Uploading Image.....'),
      barrierDismissible: false,
    );
  }

  Future<List<String>> uploadImagesToSupabase(List<XFile> images) async {
    final List<String> uploadedUrls = [];
    final supabase = Supabase.instance.client;

    try {
      for (final image in images) {
        final fileName =
            'profile_pictures/${DateTime.now().toIso8601String()}_${image.name}';
        await supabase.storage.from('care_app').upload(
              fileName,
              File(image.path),
            );
        final publicUrl =
            supabase.storage.from('care_app').getPublicUrl(fileName);
        if (publicUrl != null) {
          uploadedUrls.add(publicUrl);
        } else {
          throw Exception('Failed to generate public URL for ${image.name}');
        }
      }
    } catch (e) {
      print('Error uploading images: $e');
    }

    return uploadedUrls;
  }
}

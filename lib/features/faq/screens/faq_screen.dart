import 'package:care453/core/utils/asset_utils/image_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/widgets/customer_animation/fade_in_slide.dart';
import 'package:care453/widgets/customer_animation/rightbounce_animation.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({super.key});

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Pallete.whiteColor,
          ),
        ),
        title: Text(
          'Frequently Asked Questions',
          style: GoogleFonts.poppins(
            color: Pallete.whiteColor,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
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
                  .withOpacity(0.9), // Blue overlay with opacity
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              SizedBox(height: 40),
              BounceFromRightAnimation(
                delay: 0.5,
                child: Text(
                  "Below are some of the most commonly asked questions related to our care services.",
                  style: TextStyle(fontSize: 14),
                ),
              ),
              SizedBox(height: 25),
              buildFAQItem(
                question: "What services do you offer?",
                answer:
                    "We offer home healthcare services such as personal care, nursing assistance, physical therapy, elderly care, and rehabilitation support. We provide tailored solutions for each individual.",
              ),
              buildFAQItem(
                question: "How do I book a caregiver?",
                answer:
                    "You can book a caregiver directly through the app by scheduling an appointment, or you can call us directly for assistance with booking.",
              ),
              buildFAQItem(
                question: "Are your caregivers certified?",
                answer:
                    "Yes, all of our caregivers are certified professionals who are trained in providing high-quality care. They undergo thorough background checks and continuous training.",
              ),
              buildFAQItem(
                question: "What is the cost of your services?",
                answer:
                    "The cost of services varies depending on the type of care required. Please contact us for a personalized quote based on your needs.",
              ),
              buildFAQItem(
                question: "Can I change my caregiver?",
                answer:
                    "Yes, we understand that sometimes a caregiver may not be the right fit for you. You can request a change, and we will do our best to accommodate your needs.",
              ),
              buildFAQItem(
                question: "Do you provide emergency services?",
                answer:
                    "Yes, we offer emergency caregiving services. Please reach out to our support team for immediate assistance.",
              ),
              SizedBox(height: 20),
              FadeInSlide(
                duration: 1.1,
                child: Divider(color: Pallete.originBlue),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFAQItem({required String question, required String answer}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BounceFromRightAnimation(
          delay: 0.7,
          child: Text(
            question,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 10),
        BounceFromRightAnimation(
          delay: 1.0,
          child: Text(
            answer,
            style: TextStyle(fontSize: 14),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

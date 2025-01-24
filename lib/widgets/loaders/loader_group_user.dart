import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoaderGroupUser extends StatelessWidget {
  const LoaderGroupUser({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) => Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: ListTile(
            title: Container(height: 16, color: Colors.white),
            subtitle: Container(height: 12, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

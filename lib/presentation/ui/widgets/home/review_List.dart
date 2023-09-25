import 'package:crafty_bay/presentation/ui/widgets/home/add_new_review.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/color_palette.dart';

class ProductReviewList extends StatefulWidget {
  const ProductReviewList({
    super.key,
  });

  @override
  State<ProductReviewList> createState() => _ProductReviewListState();
}

class _ProductReviewListState extends State<ProductReviewList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
       SafeArea(

         child: Column(
           children: [
             AppBar(
               leading: const BackButton(
                 color: Colors.black54,
               ),
               title: const Text('Reviews',
                   style: TextStyle(
                     color: Colors.black54,
                   )),
               backgroundColor: Colors.transparent,
               elevation: 0,
             ),
             Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        foregroundColor: Colors.grey[600],
                        radius: 12,
                        child: const Icon(
                          Icons.person_outlined,
                          size: 16,
                        )),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text('MD. Shahadat Hossain'),
                  ],
                ),
                subtitle: const Column(
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      '''A split system air conditioner is split into two parts: a wall-mounted indoor unit in the room you’re cooling, and an outdoor unit that contains the compressor box. 
                      ''',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
      ),
           ],
         ),
       ),

      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          backgroundColor: ColorPalette.primaryColor,
          onPressed: () {
            Get.to(() => const AddReviewScreen());
          }),
    );
  }
}
import 'package:crafty_bay/presentation/ui/utils/color_palette.dart';
import 'package:flutter/material.dart';

class AddToCart extends StatefulWidget{
  const AddToCart({super.key});
  @override
  State<AddToCart> createState() => _AddToCart();
}
class _AddToCart extends State<AddToCart>{
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
          color: ColorPalette.primaryColor.withOpacity(0.1),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Price', style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.black54
              ),),
              SizedBox(height: 4,),
              Text('\$1000', style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: ColorPalette.primaryColor
              ),),
            ],
          ),
          SizedBox(
            width: 120,
            child: ElevatedButton(onPressed: () {}, child: const Text('Add to cart'),),)
        ],
      ),
    );

  }

}

import 'package:crafty_bay/presentation/ui/utils/color_palette.dart';
import 'package:flutter/material.dart';

class SelectedSizeIndex extends StatefulWidget{
  const SelectedSizeIndex({super.key, required int initialSelected, required Null Function(int selectedSize) onSelected, required sizes});
  @override
  State<SelectedSizeIndex> createState() => _SelectedSizeIndex();
}
class _SelectedSizeIndex extends State<SelectedSizeIndex>{

  List<String> sizes = ['S', 'M', 'L', 'XL', 'XXL', 'XXXL'];


  int _selectedSizeIndex = 0;

  @override
  Widget build(BuildContext context) {
   return SizedBox(
     height: 28,
     child: ListView.separated(
       scrollDirection: Axis.horizontal,
       itemCount: sizes.length,
       itemBuilder: (context, index) {
         return InkWell(
           borderRadius: BorderRadius.circular(4),
           onTap: () {
             _selectedSizeIndex = index;
             if (mounted) {
               setState(() {});
             }
           },
           child: Container(
             padding: const EdgeInsets.symmetric(horizontal: 8),
             decoration: BoxDecoration(
                 border: Border.all(color: Colors.grey),
                 borderRadius: BorderRadius.circular(4),
                 color: _selectedSizeIndex == index
                     ? ColorPalette.primaryColor
                     : null),
             alignment: Alignment.center,
             child: Text(sizes[index]),
           ),
         );
       },
       separatorBuilder: (BuildContext context, int index) {
         return const SizedBox(
           width: 8,
         );
       },
     ),
   );

  }

}
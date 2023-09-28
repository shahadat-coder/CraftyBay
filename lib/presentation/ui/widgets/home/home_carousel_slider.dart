import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/data/models/slider_data.dart';
import 'package:crafty_bay/presentation/ui/utils/color_palette.dart';
import 'package:flutter/material.dart';

class HomeCarouselSlider extends StatefulWidget {
  final List<SliderData> sliders;
  const HomeCarouselSlider({super.key, required this.sliders});

  @override
  State<HomeCarouselSlider> createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {
  final ValueNotifier<int> _selectedCarouselSlider = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 160.0,
            viewportFraction: 0.8,

            autoPlay: true,
          
            enlargeCenterPage: true,
enlargeFactor: 0.2,

            autoPlayInterval: const Duration(seconds: 3),
            onPageChanged: (index, _) {
              _selectedCarouselSlider.value = index;
            },
          ),
          items: widget.sliders.map(
            (SliderData) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        color: ColorPalette.primaryColor.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(8)),
                    alignment: Alignment.center,
                    child: Stack(
                        children: [
                          Image.network(SliderData. image ??  ''),
                          Positioned(
                            bottom: 0,
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                            Text(SliderData.title ?? '',style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            )),

                          ]))
                    ]
                    ),
                  );
                },
              );
            },
          ).toList(),
        ),
        const SizedBox(
          height: 8,
        ),
        ValueListenableBuilder(
          valueListenable: _selectedCarouselSlider,
          builder: (context, value, _) {
            List<Widget> carouselDotList = [];
            for (int i = 0; i < widget.sliders.length ; i++) {
              carouselDotList.add(Container(
                width: value == i ? 30 : 10,
                height: 10,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  border: Border.all(
                      color:
                          value == i ? ColorPalette.primaryColor : Colors.grey),
                  borderRadius: BorderRadius.circular(50),
                  color: value == i ? ColorPalette.primaryColor : null,
                ),
              ));
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: carouselDotList,
            );
          },
        )
      ],
    );
  }
}

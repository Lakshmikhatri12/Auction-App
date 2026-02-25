import 'package:cloth_store/utils/constants.dart';
import 'package:flutter/material.dart';

class BanneradsWidget extends StatefulWidget {
  const BanneradsWidget({super.key});

  @override
  State<BanneradsWidget> createState() => _BanneradsWidgetState();
}

class _BanneradsWidgetState extends State<BanneradsWidget> {
  final PageController _pageController = PageController();
  int currentAd = 0;

  List adsbanner = [
    "https://cdn.pixabay.com/photo/2020/12/17/13/35/discount-5839314_1280.jpg",
    "https://cdn.pixabay.com/photo/2020/12/17/13/35/discount-5839314_1280.jpg",
    "https://cdn.pixabay.com/photo/2020/12/17/13/35/discount-5839314_1280.jpg",
    "https://cdn.pixabay.com/photo/2020/12/17/13/35/discount-5839314_1280.jpg",
    "https://cdn.pixabay.com/photo/2020/12/17/13/35/discount-5839314_1280.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150,
          child: PageView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            controller: _pageController,
            itemCount: adsbanner.length,
            onPageChanged: (index) {
              setState(() {
                currentAd = index;
              });
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1),
                child: Container(
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(adsbanner[index]),
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        // INDICATORS
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            adsbanner.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),

              width: currentAd == index ? 22 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: currentAd == index
                    ? AppColors.primaryColor
                    : Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

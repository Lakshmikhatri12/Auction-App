import 'package:cloth_store/utils/constants.dart';
import 'package:flutter/material.dart';

class ProductListingWidget extends StatelessWidget {
  ProductListingWidget({super.key});
  final List<Map<String, dynamic>> allItems = List.generate(10, (index) {
    return {
      "name": "Olive Shirt $index",
      "price": 58.5 + index,
      "rating": 4.5,
      "category": index % 2 == 0 ? "Newest" : "Popular",
      "image": "assets/dress.jpg",
    };
  });
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.45,
      child: GridView.builder(
        shrinkWrap: true,

        itemCount: 5,
        // filteredItems.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          mainAxisExtent: 280,
        ),
        itemBuilder: (context, index) {
          // final item = filteredItems[index];
          return GestureDetector(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => ProductDetail(),
              //   ),
              // );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 230,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/dress.jpg"),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          "Dress",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.titleLarge,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.star,
                            color: AppColors.ratingColor,
                            size: 18,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "4.5",
                            //  "${item["rating"]}",
                            style: textTheme.titleSmall?.copyWith(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    "\$45",
                    // "\$${item["price"]}",
                    style: textTheme.titleMedium,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:cloth_store/utils/banner_ads.dart';
import 'package:cloth_store/utils/choice_chip.dart';
import 'package:cloth_store/utils/constants.dart';
import 'package:cloth_store/utils/product_listing_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final List<String> categories = ["All", "Newest", "Popular", "Men", "Women"];

// Selected category index
int selectedCategoryIndex = 0;

// Sample wishlist items
final List<Map<String, dynamic>> allItems = List.generate(10, (index) {
  return {
    "name": "Olive Shirt $index",
    "price": 58.5 + index,
    "rating": 4.5,
    "category": index % 2 == 0 ? "Newest" : "Popular",
    "image": "assets/dress.jpg",
  };
});

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Text("Location", style: textTheme.titleSmall),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.location_on_sharp,
                        color: AppColors.primaryColor,
                        size: 20,
                      ),
                      Text("NewYork, USA", style: textTheme.headlineSmall),
                      Icon(Icons.arrow_drop_down_outlined, size: 28),
                    ],
                  ),
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: colors.background.withOpacity(0.1),
                    child: Icon(
                      Icons.notifications,
                      color: colors.surface,
                      size: 25,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              /// --- SEARCH BAR ---
              Row(
                children: [
                  Expanded(
                    child: Material(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),

                      child: InkWell(
                        borderRadius: BorderRadius.circular(14),
                        onTap: () {
                          print("Search tapped!");
                        },
                        child: Container(
                          height: 55,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: colors.surface.withOpacity(0.2),
                            ),
                          ),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.search_outlined,
                                color: AppColors.primaryColor,
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Search",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.primaryColor,
                    ),
                    child: IconButton(
                      onPressed: () {
                        // Optional: filter action
                      },
                      icon: const Icon(Icons.filter_list, color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              BanneradsWidget(),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Category", style: textTheme.headlineLarge),
                  Text(
                    "See all",
                    style: textTheme.titleMedium?.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              SizedBox(
                height: 80,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(width: 10),
                    _categoriesList(icon: Icons.home, title: "Fashion"),
                    SizedBox(width: 28),
                    _categoriesList(icon: Icons.sports_soccer, title: "Sports"),
                    SizedBox(width: 28),
                    _categoriesList(icon: Icons.book, title: "Books"),
                    SizedBox(width: 28),
                    _categoriesList(icon: Icons.computer, title: "Tech"),
                    SizedBox(width: 28),
                    _categoriesList(icon: Icons.sports_soccer, title: "Sports"),
                    SizedBox(width: 28),
                    _categoriesList(icon: Icons.more_horiz, title: "More"),
                    SizedBox(width: 10),
                  ],
                ),
              ),

              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Flash Sale",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("closing In:", style: textTheme.titleSmall),
                      SizedBox(width: 4),
                      _time(),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              Column(
                children: [
                  // Choice Chips
                  ChoiceChipWidget(
                    options: categories,
                    onSelected: (index) {
                      setState(() {
                        selectedCategoryIndex = index;
                      });
                    },
                  ),
                  SizedBox(height: 5),
                  // Grid of wishlist items
                  ProductListingWidget(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _categoriesList({required IconData icon, required String title}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Theme.of(
            context,
          ).colorScheme.surface.withOpacity(0.1),
          child: Icon(icon, size: 28, color: AppColors.primaryColor),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 12),
        ),
      ],
    );
  }

  Widget _time() {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: AppColors.primaryColor.withOpacity(0.1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              "12",
              style: GoogleFonts.archivo(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ),
        Text(
          ":",
          style: GoogleFonts.archivo(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryColor,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: AppColors.primaryColor.withOpacity(0.1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              "12",
              style: GoogleFonts.archivo(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ),
        Text(
          ":",
          style: GoogleFonts.archivo(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryColor,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: AppColors.primaryColor.withOpacity(0.1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              "12",
              style: GoogleFonts.archivo(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

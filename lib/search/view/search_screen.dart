import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/core/constants/app_colors.dart';
import 'package:myapp/features/search/widgets/recent_search_tile.dart';
import 'package:myapp/features/search/widgets/search_result.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();

  bool showRecent = false;
  bool showResult = false;

  final List<String> recentSearch = ["jacket", "shirt", "shoes"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            20.verticalSpace,
            _searchBar(),
            20.verticalSpace,

            /// RECENT SEARCH UI
            if (showRecent && !showResult)
              /// RECENT SEARCH UI
              if (showRecent && !showResult)
                Expanded(
                  child: ListView.builder(
                    itemCount: recentSearch.length,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemBuilder: (context, index) {
                      return RecentSearchTile(
                        text: recentSearch[index],
                        onTap: () {
                          setState(() {
                            _controller.text = recentSearch[index];
                            showRecent = false;
                            showResult = true;
                          });
                        },
                      );
                    },
                  ),
                ),

            if (showResult) const Expanded(child: SearchResult()),
          ],
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(.2),
        ),
      ),
      child: TextField(
        controller: _controller,

        readOnly: true, // UI only
        decoration: InputDecoration(
          hintText: "Search here",
          border: InputBorder.none,
          prefixIcon: Icon(
            FontAwesomeIcons.search,
            size: 18,
            color: AppColors.primaryColor,
          ),
        ),
        onTap: () {
          setState(() {
            showRecent = true;
            showResult = false;
          });
        },
      ),
    );
  }

  Widget _recentList() {
    return ListView.builder(
      itemCount: recentSearch.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            tileColor: Theme.of(context).cardColor,
            title: Text(recentSearch[index]),
            trailing: const Icon(Icons.history),
            onTap: () {
              setState(() {
                _controller.text = recentSearch[index];
                showRecent = false;
                showResult = true;
              });
            },
          ),
        );
      },
    );
  }
}

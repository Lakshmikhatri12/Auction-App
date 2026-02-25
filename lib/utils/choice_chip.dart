import 'package:cloth_store/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChoiceChipWidget extends StatefulWidget {
  final List<String> options;
  final ValueChanged<int>? onSelected;

  const ChoiceChipWidget({super.key, required this.options, this.onSelected});

  @override
  State<ChoiceChipWidget> createState() => _ChoiceChipWidgetState();
}

class _ChoiceChipWidgetState extends State<ChoiceChipWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35, // increased for better touch area
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.options.length,
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index; // update selected chip
                });
                if (widget.onSelected != null) {
                  widget.onSelected!(index);
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isSelected
                        ? Theme.of(context).primaryColor
                        : AppColors.textSecondary.withOpacity(0.1),
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: isSelected
                      ? AppColors.primaryColor
                      : const Color.fromARGB(
                          255,
                          198,
                          197,
                          197,
                        ).withOpacity(0.1),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Text(
                  widget.options[index],
                  style: GoogleFonts.archivo(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: isSelected
                        ? Colors.white
                        : Theme.of(context).colorScheme.surface,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

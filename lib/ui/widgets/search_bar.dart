import 'package:flutter/material.dart';
import 'package:track_me/styles/app_colors.dart';
import 'package:track_me/styles/text_styles.dart';
import 'package:track_me/ui/widgets/spacer.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
    this.margin = const EdgeInsets.symmetric(horizontal: 28),
  });

  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      margin: margin,
      decoration: ShapeDecoration(
        shape: const StadiumBorder(),
        color: AppColors.semiGrey.withOpacity(0.2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.search, size: 26),
          const HSpacer(13),
          Expanded(
            child: TextFormField(
              decoration: const InputDecoration(
                isDense: true,
                hintText: 'Search Questions, Projects etc',
                contentPadding: EdgeInsets.zero,
                hintStyle:TextStyles.hintTextStyle,
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

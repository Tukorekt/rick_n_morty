import 'package:flutter/material.dart';
import 'package:rick_n_morty/app/themes/app_theme.dart';
import 'package:rick_n_morty/presentation/common_widgets/app_icon_button.dart';
import 'package:rick_n_morty/presentation/ui_contants.dart';

class AppBarWithSearch extends StatefulWidget implements PreferredSizeWidget {
  final void Function(bool isOpened) onSearchTap;
  final void Function(String? value) onSearch;
  final bool isSearchperformed;

  const AppBarWithSearch({
    super.key,
    required this.onSearchTap,
    required this.isSearchperformed,
    required this.onSearch,
  });

  @override
  State<AppBarWithSearch> createState() => _AppBarWithSearchState();

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}

class _AppBarWithSearchState extends State<AppBarWithSearch> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.appTheme.appBarColor,
      titleSpacing: padding8,
      title: widget.isSearchperformed
          ? Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: border16,
              ),
              child: TextField(
                maxLines: 1,
                minLines: 1,
                decoration: InputDecoration(
                  constraints: BoxConstraints(maxHeight: 40),
                  border: OutlineInputBorder(borderRadius: border16),
                  contentPadding: EdgeInsets.symmetric(horizontal: padding8),
                ),
                onChanged: widget.onSearch,
                autofocus: true,
              ),
            )
          : Text(
              'Список персонажей',
              style: context.appTheme.appBarTitleTextStyle,
            ),
      actions: [
        AppIconButton(
          onTap: () => widget.onSearchTap(!widget.isSearchperformed),
          icon: widget.isSearchperformed ? Icons.close : Icons.search,
          iconColor: context.appTheme.appBarIconsColor,
        ),
      ],
      actionsPadding: EdgeInsets.only(right: padding4),
    );
  }
}

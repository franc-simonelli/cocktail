// ignore_for_file: prefer_const_constructors
import 'dart:async';
import 'package:flutter/material.dart';

class FiltroAllIngredientiWidget extends StatefulWidget {
  const FiltroAllIngredientiWidget({
    required this.function,
    super.key,
  });

  final Function function;

  @override
  State<FiltroAllIngredientiWidget> createState() =>
      _FiltroAllIngredientiWidgetState();
}

class _FiltroAllIngredientiWidgetState
    extends State<FiltroAllIngredientiWidget> {
  final _searchController = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchWithDebounce);
  }

  _onSearchWithDebounce() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 100), () {
      searchText();
    });
  }

  void searchText() {
    widget.function(_searchController.text);
    // Provider.of<IngredientiProvider>(context, listen: false).filtraIngredienti(_searchController.text);
  }

  @override
  void dispose() {
    super.dispose();
    _debounce?.cancel();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    final appTextTheme = Theme.of(context).textTheme;

    return Opacity(
      opacity: 0.8,
      child: Container(
        decoration: BoxDecoration(
          color: appColors.background,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: appColors.onBackground),
        ),
        child: TextField(
          controller: _searchController,
          cursorColor: appColors.onBackground,
          style: TextStyle(fontSize: 18),
          decoration: InputDecoration(
            suffixIcon: Icon(
              Icons.search,
              color: appColors.onBackground,
            ),
            contentPadding: EdgeInsets.all(15),
            hintText: 'Filtra . . .',
            hintStyle: appTextTheme.labelMedium,
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

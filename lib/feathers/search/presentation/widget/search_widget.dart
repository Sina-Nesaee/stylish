import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/feathers/search/presentation/bloc/search_bloc.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextField(
        onChanged: (query) {
          return context.read<SearchBloc>().add(
            SearchProductEvent(query: query),
          );
        },
        decoration: InputDecoration(
          hintText: 'search',
          prefixIcon: Icon(CupertinoIcons.search),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/feathers/search/presentation/bloc/search_bloc.dart';

class SearchResultWidget extends StatelessWidget{
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
   return BlocBuilder<SearchBloc, SearchState>(
    builder: (context, state) {
      if(state is SearchLoading){
        return Center(child: CircularProgressIndicator(),);
      }
      if(state is SearchError){
       return Center(child: Text(state.message),);
      }
      if(state is SearchSuccess){
        return GridView.builder(
           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2,
                    crossAxisSpacing: 2,
                  ),
                  itemCount: state.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    final product = state.products[index];
                    return Container(color: Colors.red);
                  }
        );
      }
      return SizedBox();
    },
   );
  }

}
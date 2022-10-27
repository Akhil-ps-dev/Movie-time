import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/application/search/search_bloc.dart';
import 'package:flutter_movie_app/core/const.dart';
import 'package:flutter_movie_app/presentation/Search/widget/search_Idle.dart';
import 'package:flutter_movie_app/presentation/Search/widget/search_result.dart';
import '../../core/colors/colors.dart';
import '../../domain/core/debounce/debounce.dart';

class ScreenSearch extends StatelessWidget {
  ScreenSearch({super.key});
  final _debouncer = Debouncer(milliseconds: 1 * 1000);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(const Initialized());
    });
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                backgroundColor: kGrey.withOpacity(0.4),
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  color: kGrey,
                ),
                suffixIcon: const Icon(
                  CupertinoIcons.xmark_circle_fill,
                  color: kGrey,
                ),
                style: const TextStyle(color: kWhite),
                //onchanged
                onChanged: (value) {
                  if (value.isEmpty) {
                    return;
                  }
                  _debouncer.run(() {
                    BlocProvider.of<SearchBloc>(context)
                        .add(SearchMovie(movieQuery: value));
                  });
                },
              ),
              kHeight,
              Expanded(
                child: BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                    if (state.searchResultList.isEmpty) {
                      return const SearchIdleWidget();
                    } else {
                      return SearchResultWidget();
                    }
                  },
                ),
              ),
              // Expanded(
              //   child: SearchResultWidget(),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

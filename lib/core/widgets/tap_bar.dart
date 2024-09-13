import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/cubit.dart';
import 'package:news_app/bloc/state.dart';
import 'package:news_app/core/services/Apis/api_manager.dart';
import 'package:news_app/core/widgets/news_item.dart';
import 'package:news_app/core/widgets/tap_item.dart';
import 'package:news_app/modules/Manager/home_view_model.dart';
import 'package:provider/provider.dart';

class TapBar extends StatefulWidget {
  HomeCubit cubit;
  TapBar({required this.cubit, super.key});

  @override
  State<TapBar> createState() => _TapBarState();
}

class _TapBarState extends State<TapBar> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.cubit.getSources();

    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: widget.cubit.sources.length,
            child: TabBar(
                onTap: widget.cubit.onTapClicked,
                labelStyle: TextStyle(color: Colors.green),
                indicatorColor: Colors.transparent,
                labelColor: Colors.black,
                dividerColor: Colors.transparent,
                isScrollable: true,
                tabs: widget.cubit.sources
                    .map((e) => TapItem(
                  source: e,
                  isSelected: widget.cubit.sources
                      .elementAt(widget.cubit.selectedIndex) ==
                      e,
                ))
                    .toList())),

        Expanded(
          child: ListView.builder(
            itemCount: widget.cubit.article.length,
            itemBuilder: (context, index) {
              return NewsItem(
                article: widget.cubit.article[index],
                cubit: widget.cubit,
              );
            },
          ),
        )
      ],
    );
  }
}

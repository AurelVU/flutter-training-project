import 'package:app/blocs/tab/tab_bloc.dart';
import 'package:app/pages/profile.dart';
import 'package:app/widgets/tab_selector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/feed.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, TabState>(
      builder: (context, activeTab) {
        return Scaffold(
          appBar: AppBar(
            title: Text(activeTab.title),
          ),
          body: activeTab is FeedTab ? Feed() : Profile(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Navigator.pushNamed(context, ArchSampleRoutes.addTodo);
            },
            child: const Icon(Icons.add),
            //tooltip: ArchSampleLocalizations.of(context).addTodo,
          ),
          bottomNavigationBar: TabSelector(
            activeTab: activeTab is FeedTab ? AppTab.feed : AppTab.profile,
            onTabSelected: (tab) =>
                BlocProvider.of<TabBloc>(context).add(TabUpdated(tab)),
          ),
        );
      },
    );
  }
}
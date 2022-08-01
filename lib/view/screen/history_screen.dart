import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:proj2_bmi/provider/db_provider.dart';
import 'package:provider/provider.dart';

import '../widget/history_widget.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "history".tr(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer(
            builder: (context, DbProvider value, child) {
              return Consumer<DbProvider>(builder: (context, provider, x) {
                return ListView.builder(
                  reverse: true,
                    itemCount: provider.allHsitory.length,
                    itemBuilder: (context, index) {
                      return HistoryWidget(provider.allHsitory[index]);
                    });
              });
            },
          ),
        ));
  }
}

// empty body ========>>>
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class EmptyBody extends StatelessWidget {
  const EmptyBody({super.key, this.text});

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text ?? 'no_data_found',
      ).tr(),
    );
  }
}

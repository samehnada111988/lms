// error body ========>>>
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ErrorBody extends StatelessWidget {
  const ErrorBody({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Theme.of(context).scaffoldBackgroundColor,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('some_thing_went_wrong').tr(),
          const SizedBox(height: 10),
          const Text('please_try_again').tr(),
          // refresh button
          ElevatedButton(
            onPressed: onPressed ?? () {},
            child: const Text('refresh').tr(),
          ),
        ],
      ),
    );
  }
}

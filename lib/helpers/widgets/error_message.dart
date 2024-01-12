import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:kel7/bloc/user_bloc.dart';

class ErrorMessage extends StatelessWidget {
  final String? message;
  const ErrorMessage({required this.message, super.key});

  @override
  Widget build(BuildContext context) {
    // return Center(child: Text('Error:${message!}'));
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Error:${message!}'),
          ElevatedButton(
              onPressed: () {
                context.read<UserBloc>().add(const InitUser());
              },
              child: const Text('Kembali Ke Login'))
        ],
      ),
    );
  }
}

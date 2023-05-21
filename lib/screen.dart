import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assistant/data/model/auth_type_model.dart';
import 'package:flutter_assistant/data/model/otp_model.dart';
import 'package:flutter_assistant/data/model/register_model.dart';
import 'package:flutter_assistant/data/model/user_me_model.dart';
import 'package:flutter_assistant/data/repo/auth_repository.dart';
import 'package:flutter_assistant/data/repo/badge_repository.dart';
import 'package:flutter_assistant/data/repo/comment_repository.dart';
import 'package:flutter_assistant/injector.dart';
import 'package:flutter_assistant/network/failures.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () async {
            // final assistant = FlutterAssistant.init(appToken: "v", baseURL: "");
            // final response = await assistant.userMe();
            // return response.fold((l) => null, (r) => null);

            final repo = await locator<IBadgeRepository>().get();
            repo.fold((l) => 'error', (r) => print(r.success));
          },
          child: Container(
            color: Colors.red,
            width: 100,
            height: 100,
          ),
        ),
      ),
    );
  }
}

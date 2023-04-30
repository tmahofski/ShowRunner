import 'package:flutter/material.dart';
import 'package:show_runner/auth/bloc/auth_bloc.dart';
import 'package:show_runner/login/view/login_page.dart';
import 'package:show_runner/main/view/main_page.dart';

List<Page> onGenerateAppViewPages(AppStatus status, List<Page<dynamic>> pages) {
  switch (status) {
    case AppStatus.authenticated:
      return [MainPage.page()];
    case AppStatus.unauthenticated:
      return [LoginPage.page()];
  }
}

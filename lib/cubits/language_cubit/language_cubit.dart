import 'package:bloc/bloc.dart';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'language_state.dart';

class LocalizationCubit extends Cubit<LocalizationStates> {
  LocalizationCubit() : super(const LocalizationInitState());

  void changeLanguage(Locale language) {
    emit(LocalizationChangeState(language));
  }
}

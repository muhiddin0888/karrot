import 'dart:ui';

import 'package:equatable/equatable.dart';

class LocalizationStates extends Equatable {
  const LocalizationStates();

  // LocalizationStates({required this.locale});

  // factory LocalizationStates.initial() =>
  //     LocalizationStates(locale: Constants.ru);

  // LocalizationStates copyWith({required Locale locale}) =>
  //     LocalizationStates(locale: locale);

  @override
  List<Object?> get props => [];
}

class LocalizationInitState extends LocalizationStates {
  const LocalizationInitState();
}

class LocalizationChangeState extends LocalizationStates {
  final Locale lan;

  const LocalizationChangeState(this.lan);
}

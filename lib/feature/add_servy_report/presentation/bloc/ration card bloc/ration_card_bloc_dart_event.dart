import 'package:equatable/equatable.dart';

abstract class RationCardEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchRationCards extends RationCardEvent {}
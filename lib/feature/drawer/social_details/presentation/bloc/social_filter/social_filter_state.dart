// lib/feature/drawer/social_details/presentation/bloc/social_filter/social_filter_state.dart

import 'package:e_member_app/feature/drawer/social_details/domain/entity/social_entity.dart';
import 'package:e_member_app/feature/drawer/social_details/domain/entity/socila_drawer_filter_step.dart';

enum SocialDrawerStatus { initial, loading, loaded, success, error }

class SocialDrawerState {
  final SocialDrawerStatus status;
  final int currentStep;
  final SocialDrawerFilter filter;
  final List<SocialFilterStep> steps;
  final String? errorMessage;

  const SocialDrawerState({
    this.status = SocialDrawerStatus.initial,
    this.currentStep = 0,
    this.filter = const SocialDrawerFilter(),
    this.steps = const [],
    this.errorMessage,
  });

  bool get canGoNext => currentStep < steps.length - 1;
  bool get canGoPrevious => currentStep > 0;

  String? getCurrentSelection() {
    if (steps.isEmpty || currentStep >= steps.length) return null;
    
    switch (currentStep) {
      case 0:
        return filter.includedInRationCard;
      case 1:
        return filter.receivingPension;
      case 2:
        return filter.pensionType;
      case 3:
        return filter.needPension;
      case 4:
        return filter.povertyAlleviationMember;
      default:
        return null;
    }
  }

  SocialDrawerState copyWith({
    SocialDrawerStatus? status,
    int? currentStep,
    SocialDrawerFilter? filter,
    List<SocialFilterStep>? steps,
    String? errorMessage,
  }) {
    return SocialDrawerState(
      status: status ?? this.status,
      currentStep: currentStep ?? this.currentStep,
      filter: filter ?? this.filter,
      steps: steps ?? this.steps,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
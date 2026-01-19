import 'package:e_member_app/feature/drawer/social_details/domain/entity/social_entity.dart';

enum SocialDrawerStatus { initial, loading, success, error }

class SocialDrawerState {
  final int currentStep;
  final SocialDrawerFilter filter;
  final SocialDrawerStatus status;
  final String? errorMessage;

  const SocialDrawerState({
    this.currentStep = 0,
    this.filter = const SocialDrawerFilter(),
    this.status = SocialDrawerStatus.initial,
    this.errorMessage,
  });

  SocialDrawerState copyWith({
    int? currentStep,
    SocialDrawerFilter? filter,
    SocialDrawerStatus? status,
    String? errorMessage,
  }) {
    return SocialDrawerState(
      currentStep: currentStep ?? this.currentStep,
      filter: filter ?? this.filter,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  bool get canGoNext => currentStep < 4; // 5 steps (0, 1, 2, 3, 4)
  bool get canGoPrevious => currentStep > 0;
  
  String? getCurrentSelection() {
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
}
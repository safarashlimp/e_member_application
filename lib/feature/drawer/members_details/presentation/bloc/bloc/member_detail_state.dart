import 'package:e_member_app/feature/drawer/members_details/domain/entity/member_details_filter.dart';

enum MemberDetailsStatus { initial, loading, success, error }

class MemberDetailsState {
  final int currentStep;
  final MemberDetailsFilter filter;
  final MemberDetailsStatus status;
  final String? errorMessage;

  const MemberDetailsState({
    this.currentStep = 0,
    this.filter = const MemberDetailsFilter(),
    this.status = MemberDetailsStatus.initial,
    this.errorMessage,
  });

  MemberDetailsState copyWith({
    int? currentStep,
    MemberDetailsFilter? filter,
    MemberDetailsStatus? status,
    String? errorMessage,
  }) {
    return MemberDetailsState(
      currentStep: currentStep ?? this.currentStep,
      filter: filter ?? this.filter,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  bool get canGoNext => currentStep < 4;
  bool get canGoPrevious => currentStep > 0;
  
  String? getCurrentSelection() {
    switch (currentStep) {
      case 0:
        return filter.bloodGroup;
      case 1:
        return filter.gender;
      case 2:
        return filter.maritalStatus;
      case 3:
        return filter.religion;
      case 4:
        return filter.caste;
      default:
        return null;
    }
  }
}
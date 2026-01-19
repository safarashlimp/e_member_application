// lib/feature/drawer/members_details/presentation/bloc/bloc/member_detail_state.dart
import 'package:e_member_app/feature/drawer/members_details/domain/entity/member_details_filter.dart';
import 'package:e_member_app/feature/drawer/members_details/domain/entity/member_filter_step.dart';

enum MemberDetailsStatus {
  initial,
  loading,
  success,
  error,
}

class MemberDetailsState {
  final List<MemberFilterStep> steps;
  final int currentStep;
  final MemberDetailsFilter filter;
  final MemberDetailsStatus status;
  final String? errorMessage;
  final bool isLoadingData;

  const MemberDetailsState({
    this.steps = const [],
    this.currentStep = 0,
    this.filter = const MemberDetailsFilter(),
    this.status = MemberDetailsStatus.initial,
    this.errorMessage,
    this.isLoadingData = false,
  });

  String get currentStepName => steps.isNotEmpty ? steps[currentStep].name : '';
  
  List<dynamic> get currentOptions => steps.isNotEmpty ? steps[currentStep].options : [];

  String? getCurrentSelection() {
    if (steps.isEmpty) return null;
    
    final stepName = currentStepName;
    switch (stepName) {
      case 'രക്തഗ്രൂപ്പ്':
        return filter.bloodGroupId;
      case 'ലിംഗം':
        return filter.genderId;
      case 'വിവാഹസ്ഥിതി':
        return filter.maritalStatusId;
      case 'മതം':
        return filter.religionId;
      case 'ജാതി':
        return filter.casteId;
      default:
        return null;
    }
  }

  // Get display name for selected ID
  String? getCurrentSelectionName() {
    final id = getCurrentSelection();
    if (id == null || currentOptions.isEmpty) return null;
    
    try {
      return currentOptions.firstWhere((opt) => opt.id == id).name;
    } catch (e) {
      return null;
    }
  }

  bool get canGoNext => currentStep < steps.length - 1;
  bool get canGoPrevious => currentStep > 0;

  MemberDetailsState copyWith({
    List<MemberFilterStep>? steps,
    int? currentStep,
    MemberDetailsFilter? filter,
    MemberDetailsStatus? status,
    String? errorMessage,
    bool? isLoadingData,
  }) {
    return MemberDetailsState(
      steps: steps ?? this.steps,
      currentStep: currentStep ?? this.currentStep,
      filter: filter ?? this.filter,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoadingData: isLoadingData ?? this.isLoadingData,
    );
  }
}
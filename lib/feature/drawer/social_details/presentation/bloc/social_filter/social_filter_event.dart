// lib/feature/drawer/social_details/presentation/bloc/social_filter/social_filter_event.dart

abstract class SocialDrawerEvent {}

class SocialDrawerInitialize extends SocialDrawerEvent {}

class SocialDrawerStepChanged extends SocialDrawerEvent {
  final int step;
  SocialDrawerStepChanged(this.step);
}

class SocialDrawerOptionSelected extends SocialDrawerEvent {
  final int stepIndex;
  final String optionId; // This will be "1"/"0" for yes/no or actual ID for dropdown
  
  SocialDrawerOptionSelected(this.stepIndex, this.optionId);
}

class SocialDrawerNextStep extends SocialDrawerEvent {}

class SocialDrawerPreviousStep extends SocialDrawerEvent {}

class SocialDrawerReset extends SocialDrawerEvent {}

class SocialDrawerSubmit extends SocialDrawerEvent {}
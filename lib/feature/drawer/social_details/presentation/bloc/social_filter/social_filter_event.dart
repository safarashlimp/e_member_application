abstract class SocialDrawerEvent {}

class SocialDrawerStepChanged extends SocialDrawerEvent {
  final int step;
  SocialDrawerStepChanged(this.step);
}

class SocialDrawerOptionSelected extends SocialDrawerEvent {
  final String filterKey;
  final String option;
  SocialDrawerOptionSelected(this.filterKey, this.option);
}

class SocialDrawerNextStep extends SocialDrawerEvent {}

class SocialDrawerPreviousStep extends SocialDrawerEvent {}

class SocialDrawerReset extends SocialDrawerEvent {}

class SocialDrawerSubmit extends SocialDrawerEvent {}
// lib/feature/drawer/health_Details_.dart/presentation/bloc/bloc/health_detail_drawer_event.dart

abstract class HealthDrawerEvent {}

class HealthDrawerInitialize extends HealthDrawerEvent {}

class HealthDrawerStepChanged extends HealthDrawerEvent {
  final int step;
  HealthDrawerStepChanged(this.step);
}

class HealthDrawerOptionSelected extends HealthDrawerEvent {
  final int stepIndex;
  final String optionId; // This will be "1"/"0" for yes/no or actual ID for dropdown
  
  HealthDrawerOptionSelected(this.stepIndex, this.optionId);
}

class HealthDrawerNextStep extends HealthDrawerEvent {}

class HealthDrawerPreviousStep extends HealthDrawerEvent {}

class HealthDrawerReset extends HealthDrawerEvent {}

class HealthDrawerSubmit extends HealthDrawerEvent {}
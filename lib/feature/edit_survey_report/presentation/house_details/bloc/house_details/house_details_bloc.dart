// house_details_bloc.dart
import 'package:e_member_app/feature/edit_survey_report/data/repository/house_details_repository.dart';
import 'package:e_member_app/feature/edit_survey_report/domain/getclintid.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'house_details_event.dart';
import 'house_details_state.dart';

class HouseDetailsBloc
    extends Bloc<HouseDetailsEvent, HouseDetailsState> {
  final HouseDetailsRepository repository;

  HouseDetailsBloc(this.repository) : super(HouseDetailsInitial()) {
    on<SubmitHouseDetails>((event, emit) async {
      emit(HouseDetailsLoading());

      try {
        final clientId = int.parse(await getClientId()); 
        await repository.submitHouseDetails(
          clientId:clientId ,
          editId: event.editId,
          householdId: event.householdId,
          houseTypeId: event.houseTypeId,
          landTypeId: event.landTypeId,
          landAreaCents: event.landAreaCents,
          hasToilet: event.hasToilet,
          hasElectricity: event.hasElectricity,
          drinkingWaterSourceId: event.drinkingWaterSourceId,
          receivedHousingBenefit: event.receivedHousingBenefit,
          receivedBenefits: event.receivedBenefits,
          needHousingBenefit: event.needHousingBenefit,
          benefitsRequired: event.benefitsRequired,
          wardNeeds: event.wardNeeds,
          surveyor: event.surveyor,
        );

        emit(HouseDetailsSuccess());
      } catch (e) {
        emit(HouseDetailsError(e.toString()));
      }
    });
  }
}

import 'package:e_member_app/core/theme/app_color/app_color.dart';
import 'package:e_member_app/feature/add_servy_report/data/repository/family_drop_impl.dart';
  import 'package:e_member_app/feature/add_servy_report/presentation/bloc/hadBenefitBloc/required_benefit_bloc_bloc.dart';
  import 'package:e_member_app/feature/add_servy_report/presentation/bloc/hadBenefitBloc/required_benefit_bloc_event.dart';
  import 'package:e_member_app/feature/add_servy_report/presentation/bloc/house_drop/house_drop_bloc.dart';
  import 'package:e_member_app/feature/add_servy_report/presentation/bloc/house_drop/house_drop_event.dart';
  import 'package:e_member_app/feature/add_servy_report/presentation/bloc/land_type/land_type_bloc.dart';
  import 'package:e_member_app/feature/add_servy_report/presentation/bloc/land_type/land_type_event.dart';
  import 'package:e_member_app/feature/add_servy_report/presentation/bloc/required_benifit/other_benefit_bloc.dart';
  import 'package:e_member_app/feature/add_servy_report/presentation/bloc/required_benifit/other_benefit_event.dart';
  import 'package:e_member_app/feature/add_servy_report/presentation/bloc/ward_general/ward_general_bloc.dart';
  import 'package:e_member_app/feature/add_servy_report/presentation/bloc/ward_general/ward_general_event.dart';
  import 'package:e_member_app/feature/add_servy_report/presentation/bloc/water-facility/water_facility_bloc.dart';
  import 'package:e_member_app/feature/add_servy_report/presentation/bloc/water-facility/water_facility_event.dart';
  import 'package:e_member_app/feature/add_servy_report/presentation/view/add_item_basic_details.dart';
  import 'package:e_member_app/feature/add_servy_report/presentation/view/add_servy_items.dart';
import 'package:e_member_app/feature/edit_survey_report/data/repository/house_details_repository.dart';
import 'package:e_member_app/feature/edit_survey_report/presentation/house_details/bloc/house_details/house_details_bloc.dart';
  import 'package:e_member_app/feature/edit_view_family_member/presentation/enam/enam.dart';
  import 'package:e_member_app/feature/header_load/data/mapper/header_mapper.dart';
  import 'package:e_member_app/feature/header_load/domain/scareen2model.dart';
  import 'package:e_member_app/feature/header_load/presentation/HEADER%20LOAD/header_load_bloc.dart';
  import 'package:e_member_app/feature/header_load/presentation/HEADER%20LOAD/header_load_state.dart';
  import 'package:flutter/material.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';




  class HeaderLoadGate extends StatelessWidget {
    final String position;
    final PageMode mode;

    const HeaderLoadGate({
      super.key,
      required this.position,
      required this.mode,
    });

    @override
    Widget build(BuildContext context) {
      
      return BlocBuilder<HeaderLoadBloc, HeaderLoadState>(
        builder: (context, state) {
          if (state is HeaderLoadLoading) {
            return  Scaffold(
              backgroundColor: AppColor.white,
              body: Center(child: CircularProgressIndicator(
            color:     AppColor.primary,
              )),
            );
          }

          if (state is HeaderLoadLoaded) {
            
            if (position == '1') {

             int? editId;

final list = state.data['data'];
if (list != null && list.isNotEmpty) {
  editId = int.tryParse(list[0]['id'].toString());
}

            
              final screen1Data = HeaderMapper.fromApiToScreen1(state.data);
 
              return AddServyItems(
                
                mode: mode,
                headerData: screen1Data,
                editId:  editId
              );
            }

            if (position == '2') {
              // Screen 2 → Dropdowns +
              final Screen2Model screen2Data = HeaderMapper.fromApiToScreen2(state.data);
              
              return MultiBlocProvider(
                providers: [
                  

                 
                  BlocProvider(
                    create: (_) => HouseTypeBloc(FamilyDropRepositoryImpl())
                      ..add(FetchHouseTypes()),
                  ),
                  BlocProvider(
                    create: (_) => LandTypeBloc(FamilyDropRepositoryImpl())
                      ..add(FetchLandTypes()),
                  ),
                  BlocProvider(
                    create: (_) => WaterFacilityBloc(FamilyDropRepositoryImpl())
                      ..add(FetchWaterFacilities()),
                  ),
                  BlocProvider(
                    create: (_) => RequiredBenefitBloc(FamilyDropRepositoryImpl())
                      ..add(FetchRequiredBenefits()),
                  ),
                  BlocProvider(
                    create: (_) => OtherBenefitBloc(FamilyDropRepositoryImpl())
                      ..add(FetchOtherBenefits()),
                  ),
                  BlocProvider(
                    create: (_) => WardGeneralNeedBloc(FamilyDropRepositoryImpl())
                      ..add(FetchWardGeneralNeeds()),
                  ),
                     BlocProvider(
        create: (_) => HouseDetailsBloc(HouseDetailsRepository()),
      ),
                ],
                child: AddItemBasicDetails(
                  mode: mode, 
                screen2HeaderData: screen2Data,  
                ),
              );
            }

            return const Scaffold(
              body: Center(child: Text("Invalid position")),
            );
          }

          if (state is HeaderLoadError) {
            return Scaffold(
              body: Center(child: Text(state.message)),
            );
          }

          return const Scaffold(body: SizedBox.shrink());
        },
      );
    }
  }
  
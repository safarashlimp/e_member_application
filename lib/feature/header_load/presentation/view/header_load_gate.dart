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
import 'package:e_member_app/feature/edit_view_family_member/presentation/enam/enam.dart';
import 'package:e_member_app/feature/header_load/data/mapper/header_mapper.dart';
import 'package:e_member_app/feature/header_load/presentation/HEADER%20LOAD/header_load_bloc.dart';
import 'package:e_member_app/feature/header_load/presentation/HEADER%20LOAD/header_load_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeaderLoadGate extends StatelessWidget {
  final PageMode mode;
  final String position;

  const HeaderLoadGate({
    super.key,
    required this.mode,
    required this.position,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HeaderLoadBloc, HeaderLoadState>(
      builder: (context, state) {
        /// 1️⃣ LOADING
        if (state is HeaderLoadLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        /// 2️⃣ LOADED
        if (state is HeaderLoadLoaded) {
          final headerModel = HeaderMapper.fromApi(state.data);

          switch (position) {
            case '1':
              return AddServyItems(
                mode: mode,
                headerData: headerModel,
              );

            case '2':
             
  return MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => HouseTypeBloc(
          FamilyDropRepositoryImpl(),
        )..add(FetchHouseTypes()),
      ),
      BlocProvider(
        create: (_) => LandTypeBloc(
          FamilyDropRepositoryImpl(),
        )..add(FetchLandTypes()),
      ),
      BlocProvider(
        create: (_) => WaterFacilityBloc(
          FamilyDropRepositoryImpl(),
        )..add(FetchWaterFacilities()),
      ),
      BlocProvider(
        create: (_) => RequiredBenefitBloc(
          FamilyDropRepositoryImpl(),
        )..add(FetchRequiredBenefits()),
      ),
      BlocProvider(
        create: (_) => OtherBenefitBloc(
          FamilyDropRepositoryImpl(),
        )..add(FetchOtherBenefits()),
      ),
      BlocProvider(
        create: (_) => WardGeneralNeedBloc(
          FamilyDropRepositoryImpl(),
        )..add(FetchWardGeneralNeeds()),
      ),
    ],
    child: AddItemBasicDetails(
      mode: mode,
      headerData: headerModel,
    ),
  );


            default:
              return const Scaffold(
                body: Center(child: Text('Invalid position')),
              );
          }
        }

        /// 3️⃣ ERROR
        if (state is HeaderLoadError) {
          return Scaffold(
            body: Center(child: Text(state.message)),
          );
        }

        /// 4️⃣ FALLBACK (VERY IMPORTANT)
        return const Scaffold(
          body: SizedBox.shrink(),
        );
      },
    );
  }
}

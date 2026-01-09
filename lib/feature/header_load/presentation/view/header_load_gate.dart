import 'package:e_member_app/feature/header_load/data/mapper/header_mapper.dart';
import 'package:e_member_app/feature/header_load/presentation/HEADER%20LOAD/header_load_bloc.dart';
import 'package:e_member_app/feature/header_load/presentation/HEADER%20LOAD/header_load_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../add_servy_report/presentation/view/add_servy_items.dart';
import '../../../add_servy_report/presentation/view/add_item_basic_details.dart';
import '../../../edit_view_family_member/presentation/enam/enam.dart';

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
        if (state is HeaderLoadLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is HeaderLoadLoaded) {
          
  final headerModel = HeaderMapper.fromApi(state.data);
          if (position == '1') {
            return AddServyItems(
              mode: mode,
              headerData: headerModel,
            );
          }

          if (position == '2') {
            return AddItemBasicDetails(
              mode: mode,
              headerData: headerModel,
            );
          }
        }

        if (state is HeaderLoadError) {
          return Scaffold(
            body: Center(child: Text(state.message)),
          );
        }

        return const SizedBox();
      },
    );
  }
}

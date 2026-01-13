  // import 'package:e_member_app/feature/add_family_members_list/domain/repository/add_family_member/add_family_member_repo.dart';
  // import 'package:flutter_bloc/flutter_bloc.dart';



  // import 'add_family_member_event.dart';
  // import 'add_family_member_state.dart';

  // class AddFamilyMemberBloc
  //     extends Bloc<AddFamilyMemberEvent, AddFamilyMemberState> {
  //   final AddFamilyMemberRepository repository;

  //   AddFamilyMemberBloc({required this.repository})
  //       : super(const AddFamilyMemberState.initial()) {
  //     on<AddFamilyMemberEvent>(_onEvent);
  //   }

  //   Future<void> _onEvent(
  //       AddFamilyMemberEvent event, Emitter<AddFamilyMemberState> emit) async {
  //     await event.map(
  //       addFamilyMember: (e) async {
  //         emit(const AddFamilyMemberState.loading());

  //   final result = await repository.addFamilyMember(params: e.params);


  //         result.fold(
  //           (failure) => emit(AddFamilyMemberState.error(failure: failure)),
  //           (entity) => emit( AddFamilyMemberState.loaded(entity.data.detailId)),
  //         );
  //       },
  //     );
  //   }
  // }
import 'package:e_member_app/feature/add_family_members_list/data/data_source/local_data_source.dart';
import 'package:e_member_app/feature/add_family_members_list/domain/repository/add_family_member/add_family_member_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'add_family_member_event.dart';
import 'add_family_member_state.dart';

class AddFamilyMemberBloc
    extends Bloc<AddFamilyMemberEvent, AddFamilyMemberState> {
  final AddFamilyMemberRepository repository;
  final AuthLocalDataSource authLocalDataSource;

  AddFamilyMemberBloc({required this.repository,    required this.authLocalDataSource,})
      : super(const AddFamilyMemberState.initial()) {
    on<AddFamilyMemberEvent>(_onEvent);
  }

  Future<void> _onEvent(
      AddFamilyMemberEvent event, Emitter<AddFamilyMemberState> emit) async {
    await event.map(
      addFamilyMember: (e) async {
        emit(const AddFamilyMemberState.loading());
         final clientId = await authLocalDataSource.getClientId();
      final userId = await authLocalDataSource.getUserId();
      
    final updatedParams = e.params.copyWith(
          clientId: clientId,
          userId: userId,
        );

        final result = await repository.addFamilyMember(
          
          params: updatedParams);

        result.fold(
          (failure) =>
              emit(AddFamilyMemberState.error(failure: failure)),
          (entity) =>
              emit(AddFamilyMemberState.loaded(entity.data.detailId)),
        );
      },
    );
  }
}

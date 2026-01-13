// import 'package:dartz/dartz.dart';
// import 'package:e_member_app/core/error/failure.dart';
// import 'package:e_member_app/feature/add_family_members_list/data/data_source/add_family_member_data_source.dart';
// import 'package:e_member_app/feature/add_family_members_list/data/model/add_family_member_model/add_family_member_model.dart';
// import 'package:e_member_app/feature/add_family_members_list/data/view_model/add_family_member_params.dart';
// import 'package:e_member_app/feature/add_family_members_list/domain/entities/add_family_member_entity.dart';
// import 'package:e_member_app/feature/add_family_members_list/domain/repository/add_family_member/add_family_member_repo.dart';


// class AddFamilyMemberRepositoryImpl implements AddFamilyMemberRepository {
//   final AddFamilyMemberRemoteDataSource remoteDataSource;

//   AddFamilyMemberRepositoryImpl({required this.remoteDataSource});

//   @override
//   Future<Either<Failure, AddFamilyMemberEntity>> addFamilyMember({
//       required AddFamilyMemberViewModel params,
//   }) async {
//     try {
//       // Call the remote data source
//       final AddFamilyMemberModel model =
//           await remoteDataSource.addFamilyMember(params.toJson());

//       // Convert model → entity and return Right
//       return Right(AddFamilyMemberEntity.fromModel(model));
//     } catch (e) {
//       // Return Left with Failure
//       return Left(UnknownFailure(e.toString()));
//     }
//   }
// }
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_member_app/core/error/failure.dart';
import 'package:e_member_app/feature/add_family_members_list/data/data_source/add_family_member_data_source.dart';
import 'package:e_member_app/feature/add_family_members_list/data/view_model/add_family_member_params.dart';
import 'package:e_member_app/feature/add_family_members_list/domain/entities/add_family_member_entity.dart';
import 'package:e_member_app/feature/add_family_members_list/domain/repository/add_family_member/add_family_member_repo.dart';

class AddFamilyMemberRepositoryImpl implements AddFamilyMemberRepository {
  final AddFamilyMemberRemoteDataSource remoteDataSource;

  AddFamilyMemberRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, AddFamilyMemberEntity>> addFamilyMember({
    required AddFamilyMemberViewModel params,
  }) async {
    try {
     
      final model =
          await remoteDataSource.addFamilyMember(params.toJson());

      return Right(AddFamilyMemberEntity.fromModel(model));
    } on DioException catch (e) {
      return Left(UnknownFailure(
          'API error: ${e.response?.data ?? e.message}'));
    } catch (e) {
      return Left(UnknownFailure('Unexpected error: $e'));
    }
  }
}

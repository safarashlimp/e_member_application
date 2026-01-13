import 'package:dartz/dartz.dart';
import 'package:e_member_app/core/error/failure.dart';
import 'package:e_member_app/feature/add_family_members_list/data/view_model/add_family_member_params.dart';
import 'package:e_member_app/feature/add_family_members_list/domain/entities/add_family_member_entity.dart';


abstract class AddFamilyMemberRepository {
  Future<Either<Failure, AddFamilyMemberEntity>> addFamilyMember({
     required AddFamilyMemberViewModel params,
  });
}

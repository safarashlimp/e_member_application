import 'package:dio/dio.dart';
import 'package:e_member_app/feature/add_family_members_list/data/data_source/add_family_member_data_source.dart';
import 'package:e_member_app/feature/add_family_members_list/data/repository/add_family_member_repo_impl/add_family_member_repo_impl.dart';
import 'package:e_member_app/feature/add_family_members_list/domain/repository/add_family_member/add_family_member_repo.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/add_family_member_bloc/add_family_member_bloc.dart';
import 'package:get_it/get_it.dart';


final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // 🔹 Dio instance
  final dio = Dio();

  // 🔹 Remote Data Source
  final addFamilyMemberDataSource =
      AddFamilyMemberRemoteDataSourceImpl(dio: dio);
  getIt.registerSingleton<AddFamilyMemberRemoteDataSource>(
      addFamilyMemberDataSource);

  // 🔹 Repository
  final addFamilyMemberRepository = AddFamilyMemberRepositoryImpl(
    remoteDataSource: addFamilyMemberDataSource,
  );
  getIt.registerSingleton<AddFamilyMemberRepository>(
      addFamilyMemberRepository);

  // 🔹 (Optional) you can also register the Bloc if you want:
   getIt.registerFactory(() => AddFamilyMemberBloc(repository: addFamilyMemberRepository));
}

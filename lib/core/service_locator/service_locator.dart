
import 'package:dio/dio.dart';
import 'package:e_member_app/feature/add_family_members_list/data/data_source/add_family_member_data_source.dart';
import 'package:e_member_app/feature/add_family_members_list/data/data_source/local_data_source.dart';
import 'package:e_member_app/feature/add_family_members_list/data/repository/add_family_member_repo_impl/add_family_member_repo_impl.dart';
import 'package:e_member_app/feature/add_family_members_list/domain/repository/add_family_member/add_family_member_repo.dart';
import 'package:e_member_app/feature/add_family_members_list/presentation/bloc/add_family_member_bloc/add_family_member_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // 🔹 SharedPreferences instance
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  // 🔹 Dio instance
  getIt.registerLazySingleton<Dio>(() => Dio());

  // 🔹 Local Data Source
  getIt.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(sharedPreferences: getIt<SharedPreferences>()),
  );

  // 🔹 Remote Data Source
  getIt.registerLazySingleton<AddFamilyMemberRemoteDataSource>(
    () => AddFamilyMemberRemoteDataSourceImpl(dio: getIt<Dio>()),
  );

  // 🔹 Repository
  getIt.registerLazySingleton<AddFamilyMemberRepository>(
    () => AddFamilyMemberRepositoryImpl(
      remoteDataSource: getIt<AddFamilyMemberRemoteDataSource>(),
    ),
  );

  // 🔹 Bloc
  getIt.registerFactory<AddFamilyMemberBloc>(
    () => AddFamilyMemberBloc(
      repository: getIt<AddFamilyMemberRepository>(),
      authLocalDataSource: getIt<AuthLocalDataSource>(),
    ),
  );
}


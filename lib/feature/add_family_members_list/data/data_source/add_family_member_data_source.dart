import 'package:dio/dio.dart';
import 'package:e_member_app/feature/add_family_members_list/data/model/add_family_member_model/add_family_member_model.dart';


abstract class AddFamilyMemberRemoteDataSource {
  /// Sends the family member data to the API and returns the model
  Future<AddFamilyMemberModel> addFamilyMember(Map<String, dynamic> params);
}

class AddFamilyMemberRemoteDataSourceImpl
    implements AddFamilyMemberRemoteDataSource {
  final Dio dio;

  AddFamilyMemberRemoteDataSourceImpl({required this.dio});

  @override
  Future<AddFamilyMemberModel> addFamilyMember(
      Map<String, dynamic> params) async {
    try {
      final response = await dio.post(
        'https://emember.org/API/detail_save.php', // 🔗 your API endpoint
        data: params,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 200) {
        // ✅ Convert JSON to Model
        final model = AddFamilyMemberModel.fromJson(response.data);
        return model;
      } else {
        throw Exception('Failed to save family member: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception(
          'Add Family Member API error: ${e.response?.data ?? e.message}');
    }
  }
}

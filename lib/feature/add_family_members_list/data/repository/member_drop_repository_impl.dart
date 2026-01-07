import 'dart:convert';
import 'package:e_member_app/feature/add_family_members_list/data/model/family_member_model.dart';


import 'package:http/http.dart' as http;

import '../../domain/repository/member_drop_repo.dart';


class MemberDropRepositoryImpl implements MemberDropRepository {
  @override
  Future<List<MemberDropItem>> getRelations() async {
    final response = await http.get(
      Uri.parse(
        "https://emember.org/API/member_drops.php?clientid=1&posistion=1",
      ),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final model = MemberDropResponse.fromJson(jsonData);

      if (model.status) {
        return model.data;
      } else {
        throw Exception("API status false");
      }
    } else {
      throw Exception("Server error ${response.statusCode}");
    }
  }
// member_drop_repository_impl.dart
@override
Future<List<MemberDropItem>> getMaritalStatus() async {
  final response = await http.get(
    Uri.parse(
      "https://emember.org/API/member_drops.php?clientid=1&posistion=3",
    ),
  );

  final jsonData = json.decode(response.body);
  final model = MemberDropResponse.fromJson(jsonData);
  return model.data;
}
@override
Future<List<MemberDropItem>> getCastes() async {
  final response = await http.get(
    Uri.parse(
      "https://emember.org/API/member_drops.php?clientid=1&posistion=5",
    ),
  );

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    final model = MemberDropResponse.fromJson(jsonData);
    return model.data;
  } else {
    throw Exception("Failed to load caste list");
  }
}
@override
Future<List<MemberDropItem>> getQualifications() async {
  final response = await http.get(
    Uri.parse(
      "https://emember.org/API/member_drops.php?clientid=1&posistion=6",
    ),
  );

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    final model = MemberDropResponse.fromJson(jsonData);

    if (model.status) {
      return model.data;
    } else {
      throw Exception("API status false");
    }
  } else {
    throw Exception("Server error ${response.statusCode}");
  }
}

@override
Future<List<MemberDropItem>> getEducationList() async {
  final response = await http.get(
    Uri.parse(
      "https://emember.org/API/member_drops.php?clientid=1&posistion=7",
    ),
  );

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    final model = MemberDropResponse.fromJson(jsonData);

    if (model.status) {
      return model.data;
    } else {
      throw Exception("API status false");
    }
  } else {
    throw Exception("Server error ${response.statusCode}");
  }
}


@override
Future<List<MemberDropItem>> getEmploymentStatus() async {
  final response = await http.get(
    Uri.parse(
      "https://emember.org/API/member_drops.php?clientid=1&posistion=8",
    ),
  );

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    final model = MemberDropResponse.fromJson(jsonData);

    if (model.status) {
      return model.data;
    } else {
      throw Exception("API status false");
    }
  } else {
    throw Exception("Server error ${response.statusCode}");
  }
}
@override
Future<List<MemberDropItem>> getJobs() async {
  final response = await http.get(
    Uri.parse(
      "https://emember.org/API/member_drops.php?clientid=1&posistion=9",
    ),
  );

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    final model = MemberDropResponse.fromJson(jsonData);

    if (model.status) {
      return model.data;
    } else {
      throw Exception("API status false");
    }
  } else {
    throw Exception("Server error ${response.statusCode}");
  }
}

@override
Future<List<MemberDropItem>> getEmploymentSupports() async {
  final response = await http.get(
    Uri.parse(
      "https://emember.org/API/member_drops.php?clientid=1&posistion=11",
    ),
  );

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    final model = MemberDropResponse.fromJson(jsonData);

    if (model.status) {
      return model.data;
    } else {
      throw Exception("API status false");
    }
  } else {
    throw Exception("Server error ${response.statusCode}");
  }
}
@override
Future<List<MemberDropItem>> getFarmingTypes() async {
  final response = await http.get(
    Uri.parse(
      "https://emember.org/API/member_drops.php?clientid=1&posistion=12",
    ),
  );

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    final model = MemberDropResponse.fromJson(jsonData);

    if (model.status) {
      return model.data;
    } else {
      throw Exception("API status false");
    }
  } else {
    throw Exception("Server error ${response.statusCode}");
  }
}


}
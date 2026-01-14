class FamilyMemberListResponse {
    final bool status;
    final List<FamilyMember> data;

    FamilyMemberListResponse({
      required this.status,
      required this.data,
    });

    factory FamilyMemberListResponse.fromJson(Map<String, dynamic> json) {
      return FamilyMemberListResponse(
        status: json['Status'],
        data: (json['data'] as List)
            .map((e) => FamilyMember.fromJson(e))
            .toList(),
      );
    }
  }



  class FamilyMember {
    final String editId;
    final String name; 
    final String mobile;
    final String whatsapp;
    final String houseNumber;
    final String houseName;
    final String relation;
    final String age;
    final String lastModified;
    final String position;

    FamilyMember({
      required this.editId,
      required this.name,
      required this.mobile,
      required this.whatsapp,
      required this.houseNumber,
      required this.houseName,
      required this.relation,
      required this.age,
      required this.lastModified,
      required this.position,
    });

    factory FamilyMember.fromJson(Map<String, dynamic> json) {
      return FamilyMember(
        editId: json['editid'].toString(),
        name: json['name'] ?? '',
        mobile: json['mobile'] ?? '',
        whatsapp: json['whatsapp'] ?? '',
        houseNumber: json['house_number'] ?? '',
        houseName: json['house_name'] ?? '',
        relation: json['relation'] ?? '',
        age: json['age']??'',
        lastModified: json['last_modified'] ?? '',
        position: json['posistion'].toString(),
      );
    }
  }

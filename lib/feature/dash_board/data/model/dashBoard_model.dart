import 'package:e_member_app/feature/dash_board/domain/entity/dashboard_entity.dart';
import 'package:flutter/foundation.dart';

class DashboardModel  extends DashboardEntity{


  DashboardModel({


    required super.houses,
    required super.families,
    required super.members,
    required super.male,
    required super.female,
    required super.children,
    required super.elderly,
    required super.disabled,
    required super.farmers,
    required  super.rationAay,
    required super.rationPhh,
    required super.rationNphh,
    required super.rationNpns,
    required super.thozhilurap,
    required super.kudumbasree,
    required super.harithakarmasena
  });


  factory DashboardModel.fromjson(Map<String,dynamic>json){
    return DashboardModel(
     houses: json['houses'],
      families: json['families'],
      members: json['members'],
      male: json['male'],
      female: json['female'],
      children: json['children'],
      elderly: json['elderly'],
      disabled: json['disabled'],
      farmers: json['farmers'],
      rationAay: json['ration_AAY'],
      rationPhh: json['ration_PHH'],
      rationNphh: json['ration_NPHH'],
      rationNpns: json['ration_NPNS'],
      thozhilurap: json['Thozhilurap'],
      kudumbasree: json['kudumbasree'],
      harithakarmasena: json['harithakarmasena'],
                  
                  );
  }

}
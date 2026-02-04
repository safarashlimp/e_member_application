import 'dart:convert';

import 'package:e_member_app/feature/dash_board/data/model/dashBoard_model.dart';
import 'package:http/http.dart'as http;

class DashboardRemoteDatasource {
Future <DashboardModel>getDashboard(String clientId,String userId)async{

final url = "https://emember.org/API/dashboard.php?clientid=$clientId&userid=$userId";
print('userid $userId');
print('clientid $clientId');

final responce = await  http.get(Uri.parse(url));

if(responce.statusCode==200){

  final decoded = json.decode(responce.body);
  return DashboardModel.fromjson(decoded['data']);

}else{

  throw Exception("Dashboard APi is failed");
}


}

}
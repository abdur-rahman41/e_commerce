
class ResponseModel{

final int statusCode;
final bool isSuccess;
final dynamic returnData;

  ResponseModel( {required this.statusCode, required this.returnData,required this.isSuccess});
}
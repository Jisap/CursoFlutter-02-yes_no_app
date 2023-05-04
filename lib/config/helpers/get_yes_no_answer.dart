import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {

  final _dio = Dio();

  Future<Message> getAnswer() async {

    final response = await _dio.get('https://yesno.wtf/api');   // Respuesta de la api
    
    final yesNoModel = YesNoModel.fromJsonMap( response.data ); // Instancia del modelo basado en la respuesta de la api

    return yesNoModel.toMessageEntity(); // Devolvemos la respuesta según el método que la transforma
  } 
}
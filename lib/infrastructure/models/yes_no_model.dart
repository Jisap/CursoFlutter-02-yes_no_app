

import 'package:yes_no_app/domain/entities/message.dart';

class YesNoModel {

  final String answer;
  final bool forced;
  final String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });


  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel( // Creamos una nueva instancia de YesNoModel con el factory constructor (función que genera una instancia del modelo)
        answer: json["answer"],                                            // apartir de un json que será la respuesta de la api    
        forced: json["forced"],
        image: json["image"],
  );

  Map<String, dynamic> toJson() => {  // Si tenemos la instancia del modelo genera el mapa de datos
        "answer": answer,
        "forced": forced,
        "image": image,
  };

  Message toMessageEntity() => Message(   // Transforma la respuesta
    text: answer == 'yes' ? 'Si' : 'No',
    fromWho: FromWho.hers,
    imageUrl: image
  );
}



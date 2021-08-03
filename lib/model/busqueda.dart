
import 'dart:convert';

BusquedaTemplate busquedaTemplateFromJson(String str) => BusquedaTemplate.fromJson(json.decode(str));

String busquedaTemplateToJson(BusquedaTemplate data) => json.encode(data.toJson());

class BusquedaTemplate {
    BusquedaTemplate({
        this.name,
        this.categId,
    });

    String name;
    int categId;

    factory BusquedaTemplate.fromJson(Map<String, dynamic> json) => BusquedaTemplate(
        name: json["name"],
        categId: json["categ_id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "categ_id": categId,
    };

}
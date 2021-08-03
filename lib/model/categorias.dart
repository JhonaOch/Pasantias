// To parse this JSON data, do
//
//     final categoryTemplate = categoryTemplateFromJson(jsonString);

import 'dart:convert';

CategoryTemplate categoryTemplateFromJson(String str) => CategoryTemplate.fromJson(json.decode(str));

String categoryTemplateToJson(CategoryTemplate data) => json.encode(data.toJson());

class CategoryTemplate {
    CategoryTemplate({
        this.name,
        this.completeName,
        this.createDate,
        this.createUid,
        this.id,
        this.parentId,
        this.parentPath,
        this.writeDate,
        this.writeUid,
    });

    String name;
    String completeName;
    DateTime createDate;
    int createUid;
    int id;
    int parentId;
    String parentPath;
    DateTime writeDate;
    int writeUid;

    factory CategoryTemplate.fromJson(Map<String, dynamic> json) => CategoryTemplate(
        name: json["name"],
        completeName: json["complete_name"],
        createDate: DateTime.parse(json["create_date"]),
        createUid: json["create_uid"],
        id: json["id"],
        parentId: json["parent_id"],
        parentPath: json["parent_path"],
        writeDate: DateTime.parse(json["write_date"]),
        writeUid: json["write_uid"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "complete_name": completeName,
        "create_date": createDate.toIso8601String(),
        "create_uid": createUid,
        "id": id,
        "parent_id": parentId,
        "parent_path": parentPath,
        "write_date": writeDate.toIso8601String(),
        "write_uid": writeUid,
    };
}

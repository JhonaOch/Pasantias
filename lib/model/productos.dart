// To parse this JSON data, do
//
//     final productTemplate = productTemplateFromJson(jsonString);

import 'dart:convert';

ProductTemplate productTemplateFromJson(String str) => ProductTemplate.fromJson(json.decode(str));

String productTemplateToJson(ProductTemplate data) => json.encode(data.toJson());

class ProductTemplate {
    ProductTemplate({
        this.name,
        this.categId,
        this.category,
        this.color,
        this.id,
        this.imageUrl,
        this.listPrice,
        this.stockMaximo,
        this.stockMinimo,
        this.cuenta,
        this.description,
        this.descriptionPurchase,
        this.descriptionSale,
    });

    String name;
    int categId;
    String category;
    int color;
    int id;
    String imageUrl;
    double listPrice;
    int stockMaximo;
    int stockMinimo;
    int cuenta;
    String description;
    String descriptionPurchase;
    String descriptionSale;

    factory ProductTemplate.fromJson(Map<String, dynamic> json) => ProductTemplate(
        name: json["name"],
        categId: json["categ_id"],
        category: json["category"],
        color: json["color"],
        id: json["id"],
        imageUrl: json["image_url"],
        listPrice: json["list_price"],
        stockMaximo: json["stock_maximo"],
        stockMinimo: json["stock_minimo"],
        cuenta: json["cuenta"],
        description: json["description"],
        descriptionPurchase: json["description_purchase"],
        descriptionSale: json["description_sale"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "categ_id": categId,
        "category": category,
        "color": color,
        "id": id,
        "image_url": imageUrl,
        "list_price": listPrice,
        "stock_maximo": stockMaximo,
        "stock_minimo": stockMinimo,
        "cuenta": cuenta,
        "description": description,
        "description_purchase": descriptionPurchase,
        "description_sale": descriptionSale,
    };
}

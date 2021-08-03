class GenerateQuerys {
  //Clase General de los Querys
  static String getProduct = """
  query getProduct {
   product_template {
    name
    categ_id
    category
    color
    id
    image_url
    list_price
    stock_maximo
    stock_minimo
    cuenta
    description
    description_purchase
    description_sale
  }
}

  """;

  static String getCategories = """
  query getCategories {
    product_category {
    name
    complete_name
    create_date
    create_uid
    id
    parent_id
    parent_path
    write_date
    write_uid
  }
}


   """;
   static String totalProduct="""
   query totalProduct (\$category: Int!){
  product_template_aggregate(where: {categ_id: {_eq: \$category}}) {
    aggregate{
      count
    }
    
    
  }
}

   """;

   static String nombreCategory="""
   query nameCategory(\$category: Int!) {
  product_category(where: {id: {_eq: \$category}}) {
    name
  }
}
""";
   static String listaProducts="""
   query listaProductos(\$category: Int!) {
product_template(
where: { categ_id: { _eq: \$category } }
) {
	name
  list_price
  description

}

}

   """;


   static String buscarProduc= """

   query nameCategory(\$name: String) {
  product_template(where:{name:{_eq:\$name}}){
    name
    categ_id
    
  }
}


   """;

   
}

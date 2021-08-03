class GenrateMutations{
  static String insertCategories= """
  mutation insert_product_category(\$complete_name: String!, \$name: String!) {
  insert_product_category(objects: {complete_name: \$complete_name, name: \$name}) {
    returning {
      complete_name
      name   
    }
  }
}


  """
;

static String factura ="""
mutation insert_scafp_fac_factura(\$total: numeric) {
  insert_scafp_fac_factura(objects: {tipo_pago_id:1,cliente_id:1,compania_codigo:1,codigo:"2",fecha:"02/03/2012",total: \$total}) {
    returning {
      total
       
    }
  }
}

""";




}
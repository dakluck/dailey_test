view: consumer_sales {
  sql_table_name: PUBLIC.FACT_POS_DETAIL_COLDCRAFT ;;

  dimension: amount {
    type: string
    sql: ${TABLE}."AMOUNT" ;;
    hidden: yes
  }

  dimension: brand {
    type: string
    sql: ${TABLE}."BRAND" ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}."CATEGORY" ;;
  }

  dimension: chainnumber {
    type: string
    sql: ${TABLE}."CHAINNUMBER" ;;
  }

  dimension: cost {
    type: string
    sql: ${TABLE}."COST" ;;
    hidden: yes
  }

  dimension: date_sk {
    type: string
    sql: ${TABLE}."DATE_SK" ;;
    hidden: yes
  }

  dimension: dax_id {
    type: string
    sql: ${TABLE}."DAX ID" ;;
  }

  dimension: delivery_method {
    type: string
    sql: ${TABLE}."DELIVERY_METHOD" ;;
  }

  dimension: discount {
    type: number
    sql: ${TABLE}."DISCOUNT" ;;
    hidden: yes
  }

  dimension: drop {
    type: string
    sql: ${TABLE}."Drop" ;;
  }

  dimension: inventory_location {
    type: string
    sql: ${TABLE}."INVENTORY_LOCATION" ;;
  }

  dimension: item {
    type: string
    sql: ${TABLE}."ITEM" ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}."LATITUDE" ;;
    hidden: yes
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}."LONGITUDE" ;;
    hidden: yes
  }

  dimension: account_location {
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
  }

  dimension: outlet {
    type: string
    sql: ${TABLE}."OUTLET" ;;
  }

  dimension: qty {
    type: string
    sql: ${TABLE}."QTY" ;;
    hidden: yes
  }

  dimension: route_id {
    type: string
    sql: ${TABLE}."ROUTE_ID" ;;
    hidden: yes
  }

  dimension: sales_rep {
    type: string
    sql: ${TABLE}."SALES_REP" ;;
    alpha_sort: yes
  }

  dimension: transaction_type {
    type: string
    sql: ${TABLE}."TRANSACTION_TYPE" ;;
  }

  measure: gross_sales_less_buybacks {
    type: sum
    sql: ${amount} ;;
    filters: {
      field: transaction_type
      value: "Buyback,Sales"
    }
    drill_fields: []
  }

  measure: gross_units_less_buybacks {
    type: sum
    sql: ${qty} ;;
    filters: {
      field: transaction_type
      value: "Buyback,Sales"
    }
    drill_fields: []
  }

  measure: gross_cost_less_buybacks {
    type: sum
    sql: ${cost} ;;
    filters: {
      field: transaction_type
      value: "Buyback,Sales"
    }
    drill_fields: []
  }

  measure: distinct_accounts {
    type: count_distinct
    sql: ${dax_id} ;;
    drill_fields: []
  }

  measure: distinct_routes {
    type: count_distinct
    sql: ${route_id} ;;
    drill_fields: []
  }
}

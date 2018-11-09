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
    value_format: "[>=1000000000]$0.0,,,\" B\";[>=1000000]$0.0,,\" M\";[>=1000]$0.0,,\" K\";0"
    group_label: "Gross Sales Less Buybacks"
    drill_fields: [sales_measure_drill*]
    link: {
      label: "Visualize Units Per Store Per Week"
      url: "{% assign vis_config = '{
           \"type\" : \"looker_column\",
           \"limit\" : 500,
           \"column_limit\" : 50,
           \"stacking\" : \"\",
           \"show_value_labels\" : false,
           \"label_density\" : 25,
           \"legend_position\" : \"center\",
           \"x_axis_gridlines\" : false,
           \"y_axis_gridlines\" : true,
           \"show_view_names\" : false,
           \"point_style\" : \"none\",
           \"series_types\" : {},
           \"limit_displayed_rows\": false,
           \"y_axis_combined\" : true,
           \"show_y_axis_labels\" : true,
           \"show_y_axis_ticks\" : true,
           \"y_axis_tick_density\" : \"default\",
           \"y_axis_tick_density_custom\" : 5,
           \"show_x_axis_label\" : false,
           \"show_x_axis_ticks\" : true,
           \"x_axis_scale\" : \"auto\",
           \"y_axis_scale_mode\" : \"linear\",
           \"x_axis_reversed\" : false,
           \"y_axis_reversed\" : false,
           \"plot_size_by_field\" : false,
           \"ordering\" : \"none\",
           \"show_null_labels\" : false,
           \"show_dropoff\" : false,
           \"show_totals_labels\" : false,
           \"show_silhouette\" : false,
           \"totals_color\" : \"#808080\"
          }' %}
        {{ link }}&vis_config={{ vis_config | encode_uri }}&toggle=dat,pik,vis&limit=5000&sorts=date.fiscal_year_week%20desc"
      }
  }

  measure: gross_sales_less_buybacks_ty {
    type: sum
    sql: ${amount};;
    filters: {
      field: date.relative_date
      value: "%TY - Year%"
    }
    filters: {
      field: transaction_type
      value: "Buyback,Sales"
    }
    group_label: "Gross Sales Less Buybacks"
    value_format_name: measure_format_currency
  }

  measure: gross_sales_less_buybacks_ly {
    type: sum
    sql: ${amount};;
    filters: {
      field: date.relative_date
      value: "%LY - Year%"
    }
    filters: {
      field: date.to_date
      value: "To Date"
    }
    group_label: "Gross Sales Less Buybacks"
    value_format_name: measure_format_currency
  }

  measure: gross_sales_less_buybacks_var {
    type: number
    sql: ${gross_sales_less_buybacks_ty} - ${gross_sales_less_buybacks_ly};;
    value_format_name: measure_format_currency
    group_label: "Gross Sales Less Buybacks"
  }

  measure: gross_sales_less_buybacks_growth {
    type: number
    sql: ${gross_sales_less_buybacks_var}/nullif(${gross_sales_less_buybacks_ly},0) ;;
    value_format_name: percent_1
    group_label: "Gross Sales Less Buybacks"
    html:
    {% if value >= 0 %}
    <font color="green">{{ rendered_value }}</font>
    {% else %}
    <font color="red">{{ rendered_value }}</font>
    {% endif %} ;;
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

  measure: gross_units_less_buybacks_ty {
    type: sum
    sql: ${qty};;
    filters: {
      field: date.relative_date
      value: "%TY - Year%"
    }
    filters: {
      field: transaction_type
      value: "Buyback,Sales"
    }
    group_label: "Gross Units Less Buybacks"
    value_format_name: measure_format_number
  }

  measure: gross_units_less_buybacks_ly {
    type: sum
    sql: ${qty};;
    filters: {
      field: date.relative_date
      value: "%LY - Year%"
    }
    filters: {
      field: date.to_date
      value: "To Date"
    }
    group_label: "Gross Units Less Buybacks"
    value_format_name: measure_format_number
  }

  measure: gross_units_less_buybacks_var {
    type: number
    sql: ${gross_units_less_buybacks_ty} - ${gross_units_less_buybacks_ly};;
    value_format_name: measure_format_number
    group_label: "Gross Units Less Buybacks"
  }

  measure: gross_units_less_buybacks_growth {
    type: number
    sql: ${gross_units_less_buybacks_var}/nullif(${gross_units_less_buybacks_ly},0) ;;
    value_format_name: percent_1
    group_label: "Gross Units Less Buybacks"
    html:
    {% if value >= 0 %}
    <font color="green">{{ rendered_value }}</font>
    {% else %}
    <font color="red">{{ rendered_value }}</font>
    {% endif %} ;;
  }

  measure: gross_cost_less_buybacks {
    type: sum
    sql: ${cost} ;;
    filters: {
      field: transaction_type
      value: "Buyback,Sales"
    }
    value_format_name: measure_format_currency
    drill_fields: []
  }

  measure: distinct_accounts {
    type: count_distinct
    sql: ${dax_id} ;;
    drill_fields: []
  }

  measure: distinct_items {
    type: count_distinct
    sql: ${item} ;;
    drill_fields: []
  }

  measure: distinct_routes {
    type: count_distinct
    sql: ${route_id} ;;
    drill_fields: []
  }

  measure: units_per_store_per_week {
    type: number
    sql: ${gross_units_less_buybacks}/${distinct_accounts}/${date.distinct_weeks};;
    drill_fields: [store_details_drill*]
  }

  measure: units_per_store_per_sku_per_week {
    type: number
    sql: ${gross_units_less_buybacks}/${distinct_accounts}/${distinct_items}/${date.distinct_weeks};;
    drill_fields: []
  }

  set: sales_measure_drill {
    fields: [
      date.fiscal_year_week,
      units_per_store_per_week
    ]
  }

  set: store_details_drill {
    fields: [
      date.calendar_date,
      chainnumber,
      category,
      brand,
      item,
      qty,
      amount
    ]
  }

}

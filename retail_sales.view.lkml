view: retail_sales {
  sql_table_name: PUBLIC.FACT_HSTGNDITEM ;;

  dimension: bohcontrolname {
    type: string
    sql: ${TABLE}."BOHCONTROLNAME" ;;
    hidden: yes
  }

  dimension: bohcontrolnameparent {
    type: string
    sql: ${TABLE}."BOHCONTROLNAMEPARENT" ;;
    hidden: yes
  }

  dimension: checknumber {
    type: string
    sql: ${TABLE}."CHECKNUMBER" ;;
  }

  dimension: conceptitemorder {
    type: string
    sql: ${TABLE}."CONCEPTITEMORDER" ;;
    hidden: yes
  }

  dimension_group: dateofbusiness {
    type: time
    timeframes: [
      raw,
      day_of_month,
      month_num,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATEOFBUSINESS" ;;
  }

  dimension_group: datetimestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."DATETIMESTAMP" ;;
  }

  dimension: discpric {
    type: string
    sql: ${TABLE}."DISCPRIC" ;;
    hidden: yes
  }

  dimension: entryid {
    type: string
    sql: ${TABLE}."ENTRYID" ;;
    hidden: yes
  }

  dimension: excltax {
    type: string
    sql: ${TABLE}."EXCLTAX" ;;
  }

  dimension: familystyleportion {
    type: string
    sql: ${TABLE}."FAMILYSTYLEPORTION" ;;
    hidden: yes
  }

  dimension: fkcategoryid {
    type: string
    sql: ${TABLE}."FKCATEGORYID" ;;
    hidden: yes
  }

  dimension: fkdaypartid {
    type: string
    sql: ${TABLE}."FKDAYPARTID" ;;
    hidden: yes
  }

  dimension: fkemployeenumber {
    type: string
    sql: ${TABLE}."FKEMPLOYEENUMBER" ;;
    hidden: yes
  }

  dimension: fkitemid {
    type: string
    sql: ${TABLE}."FKITEMID" ;;
  }

  dimension: fkoccasionid {
    type: string
    sql: ${TABLE}."FKOCCASIONID" ;;
    hidden: yes
  }

  dimension: fkordermodeid {
    type: string
    sql: ${TABLE}."FKORDERMODEID" ;;
    hidden: yes
  }

  dimension: fkrevenueid {
    type: string
    sql: ${TABLE}."FKREVENUEID" ;;
    hidden: yes
  }

  dimension: fkstoreid {
    type: string
    sql: ${TABLE}."FKSTOREID" ;;
    hidden: yes
  }

  dimension: fktaxid {
    type: string
    sql: ${TABLE}."FKTAXID" ;;
    hidden: yes
  }

  dimension: fkterminalid {
    type: string
    sql: ${TABLE}."FKTERMINALID" ;;
    hidden: yes
  }

  dimension: fohuniquetableid {
    type: string
    sql: ${TABLE}."FOHUNIQUETABLEID" ;;
    hidden: yes
  }

  dimension: groupquickcomboid {
    type: string
    sql: ${TABLE}."GROUPQUICKCOMBOID" ;;
    hidden: yes
  }

  dimension: hour {
    type: string
    sql: ${TABLE}."HOUR" ;;
    hidden: yes
  }

  dimension: houritemadded {
    type: string
    sql: ${TABLE}."HOURITEMADDED" ;;
    hidden: yes
  }

  dimension: importchecksum {
    type: string
    sql: ${TABLE}."IMPORTCHECKSUM" ;;
    hidden: yes
  }

  dimension: importid {
    type: string
    sql: ${TABLE}."IMPORTID" ;;
    hidden: yes
  }

  dimension: incltax {
    type: string
    sql: ${TABLE}."INCLTAX" ;;
    hidden: yes
  }

  dimension: itemcoursenumber {
    type: string
    sql: ${TABLE}."ITEMCOURSENUMBER" ;;
    hidden: yes
  }

  dimension: menupanel {
    type: string
    sql: ${TABLE}."MENUPANEL" ;;
    hidden: yes
  }

  dimension: minute {
    type: string
    sql: ${TABLE}."MINUTE" ;;
    hidden: yes
  }

  dimension: minuteitemadded {
    type: string
    sql: ${TABLE}."MINUTEITEMADDED" ;;
    hidden: yes
  }

  dimension: modcode {
    type: number
    sql: ${TABLE}."MODCODE" ;;
    hidden: yes
  }

  dimension: modifierfunctiontypes {
    type: string
    sql: ${TABLE}."MODIFIERFUNCTIONTYPES" ;;
    hidden: yes
  }

  dimension: origin {
    type: string
    sql: ${TABLE}."ORIGIN" ;;
  }

  dimension: parentid {
    type: string
    sql: ${TABLE}."PARENTID" ;;
    hidden: yes
  }

  dimension: parentmodifierid {
    type: string
    sql: ${TABLE}."PARENTMODIFIERID" ;;
    hidden: yes
  }

  dimension: periodid {
    type: string
    sql: ${TABLE}."PERIODID" ;;
    hidden: yes
  }

  dimension: price {
    type: string
    sql: ${TABLE}."PRICE" ;;
    hidden: yes
  }

  dimension: qsquickcomboid {
    type: string
    sql: ${TABLE}."QSQUICKCOMBOID" ;;
    hidden: yes
  }

  dimension: quantity {
    type: string
    sql: ${TABLE}."QUANTITY" ;;
    hidden: yes
  }

  dimension: quantityunit {
    type: string
    sql: ${TABLE}."QUANTITYUNIT" ;;
    hidden: yes
  }

  dimension: revenuecenteritemorder {
    type: string
    sql: ${TABLE}."REVENUECENTERITEMORDER" ;;
    hidden: yes
  }

  dimension: seatnumber {
    type: string
    sql: ${TABLE}."SEATNUMBER" ;;
    hidden: yes
  }

  dimension: secondarytaxid {
    type: string
    sql: ${TABLE}."SECONDARYTAXID" ;;
    hidden: yes
  }

  dimension: seconditemadded {
    type: string
    sql: ${TABLE}."SECONDITEMADDED" ;;
    hidden: yes
  }

  dimension: substituteitemid {
    type: string
    sql: ${TABLE}."SUBSTITUTEITEMID" ;;
    hidden: yes
  }

  dimension_group: systemdate {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."SYSTEMDATE" ;;
    hidden: yes
  }

  dimension: type {
    type: string
    sql: ${TABLE}."TYPE" ;;
    hidden: yes
  }

  dimension: uniqueid {
    type: string
    sql: ${TABLE}."UNIQUEID" ;;
    primary_key: yes
    hidden: yes
  }

  #custom dimensions below here

  dimension: net_sales_column {
    type: string
    sql: case when ${discpric} is null then ${price} else ${discpric} end - ${incltax} ;;
    hidden: yes
  }

  #used to create faster joins
  dimension: date_sk {
    type: number
    sql: concat(${dateofbusiness_year},concat(lpad(${dateofbusiness_month_num},2,0),lpad(${dateofbusiness_day_of_month},2,0)));;
  }

  measure: net_sales {
    type: sum
    sql: ${net_sales_column};;
    filters: {
      field: modcode
      value: "not 1"
    }
    drill_fields: []
    value_format_name: measure_format_currency
    group_label: "Net Sales"
  }

 measure: net_sales_ty {
   type: sum
    sql: ${net_sales_column};;
    filters: {
      field: date.relative_date
      value: "%TY - Year%"
      }
  filters: {
    field: modcode
    value: "not 1"
  }
    group_label: "Net Sales"
  value_format_name: measure_format_currency
  }

  measure: net_sales_ly {
    type: sum
    sql: ${net_sales_column};;
    filters: {
      field: date.relative_date
      value: "%LY - Year%"
    }
    filters: {
      field: date.to_date
      value: "To Date"
    }
    filters: {
      field: modcode
      value: "not 1"
    }
    group_label: "Net Sales"
    value_format_name: measure_format_currency
  }

  measure: net_sales_var {
    type: number
    sql: ${net_sales_ty} - ${net_sales_ly};;
    group_label: "Net Sales"
    value_format_name: measure_format_currency
  }

  measure: net_sales_growth {
    type: number
    sql: ${net_sales_var}/nullif(${net_sales_ly},0) ;;
    value_format_name: percent_1
    group_label: "Net Sales"
  }

  measure: units_sold {
    type: sum
    sql: ${quantityunit} ;;
    filters: {
      field: modcode
      value: "not 1"
    }
    value_format_name: measure_format_number
    drill_fields: []
  }

  measure: avg_unit_price {
    type: number
    sql: ${net_sales}/nullif(${units_sold},0) ;;
    value_format_name: measure_format_currency
    drill_fields: []
  }

  measure: net_tickets {
    type: count_distinct
    sql: concat(${checknumber},concat(${fkstoreid},${dateofbusiness_raw})) ;;
    value_format_name: measure_format_number
    drill_fields: []
  }

  measure: units_per_transaction {
    type: number
    sql: ${net_sales}/nullif(${net_tickets},0) ;;
    drill_fields: []
    value_format_name: measure_format_number
  }
}

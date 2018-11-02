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
    hidden: yes
  }

  measure: net_sales {
    type: sum
    sql: case when ${discpric} is null then ${price} else ${discpric} end - ${incltax} ;;
    filters: {
      field: modcode
      value: "not 1"
    }
    drill_fields: []
  }

  measure: units_sold {
    type: sum
    sql: ${quantityunit} ;;
    filters: {
      field: modcode
      value: "not 1"
    }
    drill_fields: []
  }

  measure: avg_unit_price {
    type: number
    sql: ${net_sales}/${units_sold} ;;
    drill_fields: []
  }

  measure: net_tickets {
    type: count_distinct
    sql: concat(${checknumber},concat(${fkstoreid},${dateofbusiness_raw})) ;;
    drill_fields: []
  }

  measure: units_per_transaction {
    type: number
    sql: ${net_sales}/${net_tickets} ;;
    drill_fields: []
  }
}

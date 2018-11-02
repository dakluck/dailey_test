view: retail_sales {
  sql_table_name: PUBLIC.FACT_HSTGNDITEM ;;

  dimension: bohcontrolname {
    type: string
    sql: ${TABLE}."BOHCONTROLNAME" ;;
  }

  dimension: bohcontrolnameparent {
    type: string
    sql: ${TABLE}."BOHCONTROLNAMEPARENT" ;;
  }

  dimension: checknumber {
    type: string
    sql: ${TABLE}."CHECKNUMBER" ;;
  }

  dimension: conceptitemorder {
    type: string
    sql: ${TABLE}."CONCEPTITEMORDER" ;;
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
  }

  dimension: entryid {
    type: string
    sql: ${TABLE}."ENTRYID" ;;
  }

  dimension: excltax {
    type: string
    sql: ${TABLE}."EXCLTAX" ;;
  }

  dimension: familystyleportion {
    type: string
    sql: ${TABLE}."FAMILYSTYLEPORTION" ;;
  }

  dimension: fkcategoryid {
    type: string
    sql: ${TABLE}."FKCATEGORYID" ;;
  }

  dimension: fkdaypartid {
    type: string
    sql: ${TABLE}."FKDAYPARTID" ;;
  }

  dimension: fkemployeenumber {
    type: string
    sql: ${TABLE}."FKEMPLOYEENUMBER" ;;
  }

  dimension: fkitemid {
    type: string
    sql: ${TABLE}."FKITEMID" ;;
  }

  dimension: fkoccasionid {
    type: string
    sql: ${TABLE}."FKOCCASIONID" ;;
  }

  dimension: fkordermodeid {
    type: string
    sql: ${TABLE}."FKORDERMODEID" ;;
  }

  dimension: fkrevenueid {
    type: string
    sql: ${TABLE}."FKREVENUEID" ;;
  }

  dimension: fkstoreid {
    type: string
    sql: ${TABLE}."FKSTOREID" ;;
  }

  dimension: fktaxid {
    type: string
    sql: ${TABLE}."FKTAXID" ;;
  }

  dimension: fkterminalid {
    type: string
    sql: ${TABLE}."FKTERMINALID" ;;
  }

  dimension: fohuniquetableid {
    type: string
    sql: ${TABLE}."FOHUNIQUETABLEID" ;;
  }

  dimension: groupquickcomboid {
    type: string
    sql: ${TABLE}."GROUPQUICKCOMBOID" ;;
  }

  dimension: hour {
    type: string
    sql: ${TABLE}."HOUR" ;;
  }

  dimension: houritemadded {
    type: string
    sql: ${TABLE}."HOURITEMADDED" ;;
  }

  dimension: importchecksum {
    type: string
    sql: ${TABLE}."IMPORTCHECKSUM" ;;
  }

  dimension: importid {
    type: string
    sql: ${TABLE}."IMPORTID" ;;
  }

  dimension: incltax {
    type: string
    sql: ${TABLE}."INCLTAX" ;;
  }

  dimension: itemcoursenumber {
    type: string
    sql: ${TABLE}."ITEMCOURSENUMBER" ;;
  }

  dimension: menupanel {
    type: string
    sql: ${TABLE}."MENUPANEL" ;;
  }

  dimension: minute {
    type: string
    sql: ${TABLE}."MINUTE" ;;
  }

  dimension: minuteitemadded {
    type: string
    sql: ${TABLE}."MINUTEITEMADDED" ;;
  }

  dimension: modcode {
    type: string
    sql: ${TABLE}."MODCODE" ;;
  }

  dimension: modifierfunctiontypes {
    type: string
    sql: ${TABLE}."MODIFIERFUNCTIONTYPES" ;;
  }

  dimension: origin {
    type: string
    sql: ${TABLE}."ORIGIN" ;;
  }

  dimension: parentid {
    type: string
    sql: ${TABLE}."PARENTID" ;;
  }

  dimension: parentmodifierid {
    type: string
    sql: ${TABLE}."PARENTMODIFIERID" ;;
  }

  dimension: periodid {
    type: string
    sql: ${TABLE}."PERIODID" ;;
  }

  dimension: price {
    type: string
    sql: ${TABLE}."PRICE" ;;
  }

  dimension: qsquickcomboid {
    type: string
    sql: ${TABLE}."QSQUICKCOMBOID" ;;
  }

  dimension: quantity {
    type: string
    sql: ${TABLE}."QUANTITY" ;;
  }

  dimension: quantityunit {
    type: string
    sql: ${TABLE}."QUANTITYUNIT" ;;
  }

  dimension: revenuecenteritemorder {
    type: string
    sql: ${TABLE}."REVENUECENTERITEMORDER" ;;
  }

  dimension: seatnumber {
    type: string
    sql: ${TABLE}."SEATNUMBER" ;;
  }

  dimension: secondarytaxid {
    type: string
    sql: ${TABLE}."SECONDARYTAXID" ;;
  }

  dimension: seconditemadded {
    type: string
    sql: ${TABLE}."SECONDITEMADDED" ;;
  }

  dimension: substituteitemid {
    type: string
    sql: ${TABLE}."SUBSTITUTEITEMID" ;;
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
  }

  dimension: type {
    type: string
    sql: ${TABLE}."TYPE" ;;
  }

  dimension: uniqueid {
    type: string
    sql: ${TABLE}."UNIQUEID" ;;
  }

  measure: count {
    type: count
    drill_fields: [bohcontrolname]
  }
}

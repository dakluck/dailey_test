view: date {
  sql_table_name: PUBLIC.DIM_DATE ;;

  dimension_group: date {
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
    sql: ${TABLE}."DATE" ;;
  }

  dimension: date_sk {
    type: string
    sql: ${TABLE}."DATE_SK" ;;
  }

  dimension: day_name {
    type: string
    sql: ${TABLE}."DAY_NAME" ;;
  }

  dimension: fiscal_day {
    type: string
    sql: ${TABLE}."FISCAL_DAY" ;;
  }

  dimension: fiscal_month {
    type: string
    sql: ${TABLE}."FISCAL_MONTH" ;;
  }

  dimension: fiscal_quarter {
    type: string
    sql: ${TABLE}."FISCAL_QUARTER" ;;
  }

  dimension: fiscal_week {
    type: string
    sql: ${TABLE}."FISCAL_WEEK" ;;
  }

  dimension: fiscal_year {
    type: string
    sql: ${TABLE}."FISCAL_YEAR" ;;
  }

  dimension: relative_date {
    type: string
    sql: ${TABLE}."RELATIVE_DATE" ;;
  }

  dimension: to_date {
    type: string
    sql: ${TABLE}."TO_DATE" ;;
  }

  measure: count {
    type: count
    drill_fields: [day_name]
  }
}

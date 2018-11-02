view: date {
  sql_table_name: PUBLIC.DIM_DATE ;;

  dimension_group: calendar {
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
    type: number
    sql: ${TABLE}."FISCAL_DAY" ;;
    group_label: "Fiscal Date"
    hidden: yes
  }

  dimension: fiscal_month {
    type: number
    sql: ${TABLE}."FISCAL_MONTH" ;;
    group_label: "Fiscal Date"
  }

  dimension: fiscal_quarter {
    type: number
    sql: ${TABLE}."FISCAL_QUARTER" ;;
    group_label: "Fiscal Date"
  }

  dimension: fiscal_week {
    type: number
    sql: ${TABLE}."FISCAL_WEEK" ;;
    group_label: "Fiscal Date"
  }

  dimension: fiscal_year {
    type: number
    sql: ${TABLE}."FISCAL_YEAR" ;;
    group_label: "Fiscal Date"
  }

  dimension: relative_date {
    type: string
    sql: ${TABLE}."RELATIVE_DATE" ;;
  }

  dimension: to_date {
    type: string
    sql: ${TABLE}."TO_DATE" ;;
  }

  measure: distinct_weeks  {
    type: count_distinct
    sql: concat(${fiscal_year},${fiscal_week}) ;;
  }
}

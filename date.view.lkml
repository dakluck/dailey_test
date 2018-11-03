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
    type: number
    sql: ${TABLE}."DATE_SK" ;;
    hidden: yes
  }

  dimension: day_name {
    type: string
    sql: lpad(${TABLE}."DAY_NAME",6,0) ;;
  }

  dimension: fiscal_day {
    type: number
    sql: ${TABLE}."FISCAL_DAY" ;;
    group_label: "Fiscal Date"
    hidden: yes
  }

  dimension: fiscal_year_day {
    type: string
    sql: concat(${fiscal_year},concat(' - ', concat(${fiscal_month}, concat(' - ',${fiscal_day}))));;
    group_label: "Fiscal Date"
    order_by_field: fiscal_year_day_sort
  }

  dimension: fiscal_week {
    type: number
    sql: lpad(${TABLE}."FISCAL_WEEK",2,0) ;;
    group_label: "Fiscal Date"
  }

  dimension: fiscal_year_week {
    type: string
    sql: concat(${fiscal_year},concat(' - ', ${fiscal_week}));;
    group_label: "Fiscal Date"
    order_by_field: fiscal_year_week_sort
  }

  dimension: fiscal_month {
    type: number
    sql: lpad(${TABLE}."FISCAL_MONTH",2,0) ;;
    group_label: "Fiscal Date"
  }

  dimension: fiscal_year_month {
    type: string
    sql: concat(${fiscal_year},concat(' - ', ${fiscal_month}));;
    group_label: "Fiscal Date"
    order_by_field: fiscal_year_month_sort
    drill_fields: [fiscal_year_week]
  }

  dimension: fiscal_quarter {
    type: number
    sql: lpad(${TABLE}."FISCAL_QUARTER",2,0) ;;
    group_label: "Fiscal Date"
  }

  dimension: fiscal_year_quarter {
    type: string
    sql: concat(${fiscal_year},concat(' - ', ${fiscal_quarter}));;
    group_label: "Fiscal Date"
    order_by_field: fiscal_year_quarter_sort
  }

  dimension: fiscal_year {
    type: number
    sql: ${TABLE}."FISCAL_YEAR" ;;
    group_label: "Fiscal Date"
  }

  dimension: fiscal_year_month_sort {
    type: number
    sql: concat(${fiscal_year},${fiscal_month});;
    hidden: yes
  }

  dimension: fiscal_year_quarter_sort {
    type: number
    sql: concat(${fiscal_year},${fiscal_quarter});;
    hidden: yes
  }

  dimension: fiscal_year_week_sort {
    type: number
    sql: concat(${fiscal_year},${fiscal_week});;
    group_label: "Fiscal Date"
    hidden: yes
  }

  dimension: fiscal_year_day_sort {
    type: number
    sql: concat(${fiscal_year},concat(${fiscal_month},${fiscal_day}));;
    group_label: "Fiscal Date"
    hidden: yes
  }

  dimension: relative_date {
    type: string
    sql: ${TABLE}."RELATIVE_DATE" ;;
  }

  dimension: relative_date_clean {
    type: string
    case: {
      when: {
        sql: ${relative_date} = 'LY - Year' ;;
        label: "LY - Year"
      }
      when: {
        sql: ${relative_date} = 'LY - Year;LY - Quarter' ;;
        label: "LY - Quarter"
      }
      when: {
        sql: ${relative_date} = 'LY - Year;LY - Quarter;LY - Month' ;;
        label: "LY - Month"
      }
      when: {
        sql: ${relative_date} = 'LY - Year;LY - Quarter;LY - Month;LY - Week' ;;
        label: "LY - Week"
      }
      when: {
        sql: ${relative_date} = 'LY - Year;LY - Quarter;LY - Month;LY - Week;LY - Day' ;;
        label: "LY - Day"
      }
      when: {
        sql: ${relative_date} = 'TY - Year' ;;
        label: "TY - Year"
      }
      when: {
        sql: ${relative_date} = 'TY - Year;TY - Quarter' ;;
        label: "TY - Quarter"
      }
      when: {
        sql: ${relative_date} = 'TY - Year;TY - Quarter;TY - Month' ;;
        label: "TY - Month"
      }
      when: {
        sql: ${relative_date} = 'TY - Year;TY - Quarter;TY - Month;TY - Week' ;;
        label: "TY - Week"
      }
      when: {
        sql: ${relative_date} = 'TY - Year;TY - Quarter;TY - Month;TY - Week;TY - Day' ;;
        label: "TY - Day"
      }
      else: "NULL"
    }
  }

  dimension: relative_date_test_ty {
    type: string
    sql: replace(${relative_date},'.. - ') ;;
  }

  dimension: to_date {
    type: string
    sql: ${TABLE}."TO_DATE" ;;
  }

  measure: distinct_weeks  {
    type: count_distinct
    sql: concat(${fiscal_year},${fiscal_week}) ;;
  }

  measure: distinct_days  {
    type: count_distinct
    sql: concat(${fiscal_year},concat(${fiscal_month},${fiscal_day}) ;;
  }
}

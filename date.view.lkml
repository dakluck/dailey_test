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

  dimension: fiscal_year_week {
    type: string
    sql: concat(${fiscal_year},concat(' - ', ${fiscal_week}));;
    group_label: "Fiscal Date"
    order_by_field: fiscal_year_week_sort
  }

  dimension: fiscal_year_week_sort {
    type: number
    sql: concat(${fiscal_year},${fiscal_week});;
    group_label: "Fiscal Date"
    hidden: yes
  }

  dimension: relative_date {
    type: string
    sql: ${TABLE}."RELATIVE_DATE" ;;
  }

  dimension: relative_date_filter {
    type: string
    case: {
      when: {
        sql: ${relative_date} like '%Year%' ;;
        label: "YTD"
      }
      when: {
        sql: ${relative_date} like '%Quarter%' ;;
        label: "QTD"
      }
      when: {
        sql: ${relative_date} like '%Month%' ;;
        label: "MTD"
      }
      when: {
        sql: ${relative_date} like '%Week%' ;;
        label: "WTD"
      }
      when: {
        sql: ${relative_date} like '%Day%' ;;
        label: "YESTERDAY"
      }
      else: ""
    }
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

  dimension: relative_date_test {
    type: string
    sql: replace(${relative_date},or('TY - ','LY - '),'') ;;
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

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

  dimension: relative_date_clean_relative {
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
        sql: ${relative_date} = 'TY - Year' ;;
        label: "TY - Year"
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

  dimension: relative_date_clean_absolute {
    type: string
    case: {
      when: {
        sql: ${relative_date} like '%Year%',${to_date} = 1;;
        label: "Year"
      }
      when: {
        sql: and(${relative_date} like '%Year%', ${relative_date} like '%Quarter%',${to_date} = 1);;
        label: "Quarter"
      }
      when: {
        sql: and(${relative_date} like '%Year%', ${relative_date} like '%Quarter%',${relative_date} like '%Month%',${to_date} = 1);;
        label: "Month"
      }
       when: {
        sql: and(${relative_date} like '%Year%', ${relative_date} like '%Quarter%',${relative_date} like '%Month%',${relative_date} like '%Week%',${to_date} = 1);;
        label: "Week"
      }
    }
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

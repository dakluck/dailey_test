connection: "snowflake_pc_dailey_test"

# include all the views
include: "*.view"

datagroup: dailey_test_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: dailey_test_default_datagroup

named_value_format: measure_format_number {
  value_format: "[>=1000000000]0.0,,,\" B\";[>=1000000]0.0,,,\" M\";[>=1000]0.0,,,\" K\";0"
}

named_value_format: measure_format_currency {
  value_format: "[>=1000000000]$0.0,,,\" B\";[>=1000000]$0.0,,,\" M\";[>=1000]$0.0,,,\" K\";0"
}


explore: retail_sales {
  join: date {
    relationship: many_to_one
    sql_on: ${retail_sales.date_sk} = ${date.date_sk} ;;
  }
  group_label: "Retail"
}

explore: consumer_sales {
  join: date {
    relationship: many_to_one
    sql_on: ${consumer_sales.date_sk} = ${date.date_sk} ;;
  }
  group_label: "Consumer"
}

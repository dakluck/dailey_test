connection: "snowflake_pc_dailey_test"

# include all the views
include: "*.view"

datagroup: dailey_test_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: dailey_test_default_datagroup

explore: retail_sales {
  join: date {
    relationship: many_to_one
    sql: ${retail_sales.dateofbusiness_date} = ${date.date_date} ;;
  }
  group_label: "Retail"
}

explore: consumer_sales {
  join: date {
    relationship: many_to_one
    sql: ${consumer_sales.date_sk} = ${date.date_sk} ;;
  }
  group_label: "Consumer"
}

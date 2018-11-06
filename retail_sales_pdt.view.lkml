# view: retail_sales_pdt {
#     derived_table: {
#       explore_source: retail_sales {
#         column: date_sk {
#           field: retail_sales.date_sk
#         }
#         column: store_id {
#           field: retail_sales.fkstoreid
#         }
#         column: item_id {
#           field: retail_sales.fkitemid
#         }
#         column: net_sales {
#           field: retail_sales.net_sales
#         }
#       }
#     }

#   dimension: date_sk {
#     type: number
#     sql: ${TABLE}.date_sk ;;
#   }

#     dimension: store_id {
#       type: number
#       sql: ${TABLE}.fkstoreid ;;
#     }
#     dimension: item_id {
#       type: number
#       sql: ${TABLE}.fkitemid ;;
#     }
#     measure: net_sales {
#       type: number
#       sql: ${TABLE}.net_sales ;;
#     }
#   }

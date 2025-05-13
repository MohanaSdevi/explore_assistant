view: transactions {
  sql_table_name: `sqsh-looker-project.marketing_analytics.transactions` ;;
  drill_fields: [transaction_id]

  dimension: transaction_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.transaction_id ;;
  }
  dimension: customer_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.customer_id ;;
  }
  measure: price {
    type: sum
    sql: ${TABLE}.price ;;
    value_format: "#,##0"
  }
  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_id ;;
  }
  measure: quantity {
    type: sum
    sql: ${TABLE}.quantity ;;
    value_format: "#,##0"
  }
  dimension: store_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.store_id ;;
  }
  dimension_group: transaction {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.transaction_date ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  transaction_id,
  stores.store_id,
  products.product_id,
  products.name,
  customers.last_name,
  customers.customer_id,
  customers.first_name
  ]
  }

}

view: customers {
  sql_table_name: sqsh-developer-pocs.marketing_analytics.customers ;;
  drill_fields: [customer_id]

  dimension: customer_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.customer_id ;;
  }
  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }
  dimension: first_name {
    type: string
    sql: concat(${TABLE}.first_name || ' ' || ${TABLE}.last_name)  ;;
  }
  dimension_group: join {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.join_date ;;
  }
  # dimension: last_name {
  #   type: string
  #   sql: ${TABLE}.last_name ;;
  # }
  measure: count {
    type: count
    drill_fields: [customer_id, first_name, interactions.count, transactions.count]
  }
  measure: customer_count{
    type: number
    sql: count(${customer_id}) ;;
  }

}

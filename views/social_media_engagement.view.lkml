view: social_media_engagement {
  sql_table_name: `sqsh-looker-project.marketing_analytics.social_media_engagement` ;;

  dimension: campaign_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.campaign_id ;;
  }
  dimension: comments {
    type: number
    sql: ${TABLE}.comments ;;
  }
  dimension_group: engagement {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.engagement_date ;;
  }
  dimension: engagement_id {
    type: number
    sql: ${TABLE}.engagement_id ;;
  }
  dimension: likes {
    type: number
    sql: ${TABLE}.likes ;;
  }
  dimension: post_id {
    type: string
    sql: ${TABLE}.post_id ;;
  }
  dimension: shares {
    type: number
    sql: ${TABLE}.shares ;;
  }
  measure: count {
    type: count
    drill_fields: [campaigns.name, campaigns.campaign_id]
  }
}

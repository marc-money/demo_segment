view: groups {
  sql_table_name: moneystreamios.groups ;;

  dimension: group_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.group_id ;;
  }

  dimension: anonymous_id {
    type: string
    sql: ${TABLE}.anonymous_id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created ;;
  }

  dimension_group: received {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.received_at ;;
  }

  measure: count {
    type: count
    drill_fields: [group_id, users.id, satisfaction_ratings.count, tickets.count]
  }
}

view: order_items_parameter {
  dimension: a {
    type: string
    sql: ${TABLE}.a ;;
  }

  dimension: b {
    type: string
    sql: ${TABLE}.b ;;
  }

  dimension: c {
    type: string
    sql: ${TABLE}.c ;;
  }

  dimension: d {
    type: string
    sql: ${TABLE}.d ;;
  }

  dimension: e {
    type: number
    sql: ${TABLE}.e ;;
  }

  measure: e_sum {
    type: sum
    sql: CASE
           WHEN {% parameter exclude_c %} = 'yes' THEN
             CASE
               WHEN ${c} = 'value_to_exclude' THEN NULL
               ELSE ${e}
             END
           ELSE ${e}
         END ;;
  }

  parameter: exclude_c {
    type: unquoted
    allowed_value: {
      label: "Yes"
      value: "yes"
    }
    allowed_value: {
      label: "No"
      value: "no"
    }
    default_value: "no"
  }
}

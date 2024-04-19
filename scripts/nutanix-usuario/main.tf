#data "nutanix_access_control_policies" "test" {}

data "nutanix_roles" "roles" {}
data "nutanix_permissions" "permissions" {}


resource "nutanix_access_control_policy" "test" {
    name        = "NAME OF ACCESS CONTROL POLICY"
    description = "DESCRIPTION OF THE ACCESS CONTROL POLICY"
    
    role_reference {
        kind = "role"
        uuid = "UUID of role"
    }
    user_reference_list{
        uuid = "UUID of User existent"
        name = "admin"
    }

    context_filter_list{
        entity_filter_expression_list{
            operator = "IN"
            left_hand_side_entity_type = "cluster"
            right_hand_side{
                uuid_list = ["00058ef8-c31c-f0bc-0000-000000007b23"]
            }
        }
        entity_filter_expression_list{
            operator = "IN"
            left_hand_side_entity_type = "image"
            right_hand_side{
                collection = "ALL"
            }
        }
        entity_filter_expression_list{
            operator = "IN"
            left_hand_side_entity_type = "category"
            right_hand_side{
                collection = "ALL"
            }
        }
        entity_filter_expression_list{
            operator = "IN"
            left_hand_side_entity_type = "marketplace_item"
            right_hand_side{
                collection = "SELF_OWNED"
            }
        }
        entity_filter_expression_list{
            operator = "IN"
            left_hand_side_entity_type = "app_task"
            right_hand_side{
                collection = "SELF_OWNED"
            }
        }
        entity_filter_expression_list{
            operator = "IN"
            left_hand_side_entity_type = "app_variable"
            right_hand_side{
                collection = "SELF_OWNED"
            }
        }
    }
}
class IntegerToStringOnGroupIdInDojoEventServices < ActiveRecord::Migration[5.0]
  def up
    change_column :dojo_event_services, :group_id, :string, null: false
  end

  if connection.adapter_name == 'PostgreSQL'
    def down
      change_column :dojo_event_services, :group_id, 'integer USING CAST(group_id AS integer)', null: false
    end
  else
    def down
      change_column :dojo_event_services, :group_id, :integer, null: false
    end
  end
end

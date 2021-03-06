class IntegerToStringOnServiceGroupIdAndEventIdInEventHistories < ActiveRecord::Migration[5.0]
  def up
    change_column :event_histories, :service_group_id, :string, null: false
    change_column :event_histories, :event_id, :string, null: false
  end

  if connection.adapter_name == 'PostgreSQL'
    def down
      change_column :event_histories, :service_group_id, 'integer USING CAST(service_group_id AS integer)', null: false
      change_column :event_histories, :event_id, 'integer USING CAST(event_id AS integer)', null: false
    end
  else
    def down
      change_column :event_histories, :service_group_id, :integer, null: false
      change_column :event_histories, :event_id, :integer, null: false
    end
  end
end

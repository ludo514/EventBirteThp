class ModifLien < ActiveRecord::Migration[5.2]
  def change
  	remove_reference :events, :administrator
  	remove_reference :attendances, :user
  	remove_reference :attendances, :event

  	add_reference :attendances, :user, foreign_key: true, on_delete: :cascade
  	add_reference :attendances, :event, foreign_key: true, on_delete: :cascade
  	add_reference :events, :administrator, index: true, on_delete: :cascade

  end
end

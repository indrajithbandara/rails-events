class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
    	t.string :title
    	t.string :location
    	t.datetime :start_date
    	t.datetime :end_date
    	# https://apidock.com/rails/ActiveRecord/Associations/ClassMethods/belongs_to
    	# belongs_to(name, scope = nil, options = {}) public
  		t.belongs_to :user, index: true
  		t.timestamps
    end
  add_index :events, :title, unique: true
  end
end

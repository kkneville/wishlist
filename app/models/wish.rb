class Wish < ActiveRecord::Base
  belongs_to :wisher, foreign_key: :wisher_id, class_name: User
  belongs_to :wished_for, foreign_key: :wished_for_id, class_name: Item
end

class Santum < ActiveRecord::Base
  belongs_to :gifter, foreign_key: :gifter_id, class_name: 	User
  belongs_to :giftee, foreign_key: :giftee_id, class_name: User
end

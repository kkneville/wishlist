class Item < ActiveRecord::Base
  belongs_to :user
  has_many :wishes, foreign_key: :wisher_id
  has_many :wishers, through: :wishes, source: :wisher
end

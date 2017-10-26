class Supervision < ActiveRecord::Base
  belongs_to :lead, foreign_key: :lead_id, class_name: User
  belongs_to :dr, foreign_key: :dr_id, class_name: User
end

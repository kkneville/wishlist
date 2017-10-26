class Dept < ActiveRecord::Base
	has_many :users, dependent: :nullify
end

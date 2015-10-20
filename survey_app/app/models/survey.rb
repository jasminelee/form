class Survey < ActiveRecord::Base
	belongs_to :user
#	belongs_to :kind

	validates :questions, :presence => true
	validates :user, :presence => true
	validates :answers, :presence => true
	validates :kind_id, :presence => true
end

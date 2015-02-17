class User < ActiveRecord::Base

	validates :name, :presence => true, :allow_blank => false
	validates :address, :presence => true, :allow_blank => false

end
class Store < ApplicationRecord
	has_many :sections
	has_many :managers
	has_many :records


  validates :storereg_no, :name, :address, :contact, presence: 
regcontact = /0((60[3-9]|64[0-5])\d{6}|(7[1-4689]|6[1-3]|8[1-4])\d{7})$/
validates :contact, format: { with: regcontact, :multiline => true }
end


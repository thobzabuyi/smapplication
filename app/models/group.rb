class Group < ApplicationRecord
  belongs_to :section
  has_many :items
  validates :name, :desc, presence: true

  

end
class Section < ApplicationRecord
  belongs_to :store
  has_many :groups
 validates :sec_code, :name, :desc, presence: true
end
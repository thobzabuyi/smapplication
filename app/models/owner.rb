class Owner < ApplicationRecord
  has_secure_password
  validates :fname, :lname, :role, :contact, :username, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :username, uniqueness: { case_sensitive: false }
  validates_presence_of :password, :on => :create
  validates :address, presence: true
  regpas = /^(?=.*\d)(?=.*([a-z]||[A-Z]))([\x20-\x7E]){6,40}$/
  validates :password, format: {with: regpas, :multiline => true, message: "must be at least 6 characters and include one number and one letter and one special character."}
  regcontact = /0((60[3-9]|64[0-5])\d{6}|(7[1-4689]|6[1-3]|8[1-4])\d{7})$/
  validates :contact, format: { with: regcontact, :multiline => true }
end

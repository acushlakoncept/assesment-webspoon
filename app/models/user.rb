class User < ApplicationRecord
    enum status: { inactive: 'inactive', active: 'active' }
    validates :status, inclusion: { in: statuses.keys, message: 'Use "active" or "inactive"' }
    validates :title, :name, :email, presence: true, length: { minimum: 2 }
    validates_uniqueness_of :email, case_sensitive: false, message: 'Email already taken.'
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :phone, presence: true, numericality: true
end

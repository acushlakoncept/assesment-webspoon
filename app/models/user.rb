# frozen_string_literal: true

class User < ApplicationRecord
  enum status: { inactive: 'inactive', active: 'active' }
  validates :status, inclusion: { in: statuses.keys, message: 'Use "active" or "inactive"' }
  validates :title, :name, :email, presence: true, length: { minimum: 2 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: { case_sensitive: false }
  validates :phone, presence: true, numericality: true

  scope :order_users, lambda {
                        order(updated_at: :desc).order(name: :asc).order(email: :asc).order(title: :asc).order(phone: :asc).order(status: :asc)
                      }

  def self.search(search)
    if search
      User.where('lower(name) LIKE ? OR lower(email) LIKE ? OR lower(status) LIKE ? OR phone = ?',
                 "%#{search.downcase}%", "%#{search.downcase}%", search.downcase.to_s, search.to_i)

    else
      User.all
    end
  end
end

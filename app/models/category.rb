class Category < ApplicationRecord
  belongs_to :user
  has_many :expenses, dependent: :delete_all
  validates :name, presence: true
end

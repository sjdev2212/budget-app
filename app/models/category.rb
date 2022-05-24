class Category < ApplicationRecord
  ICONS = %w[entertainment groceries utilities housing clothing healthcare transportation miscellaneous].freeze
  belongs_to :user
  has_many :expenses, foreign_key: 'category_id', class_name: 'Expense', dependent: :delete_all

  validates :name, presence: true
end

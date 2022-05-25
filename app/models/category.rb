class Category < ApplicationRecord
  ICONS = %w[entertainment groceries bills education clothing transportation extras].freeze
  belongs_to :user
  has_many :expenses, foreign_key: 'category_id', class_name: 'Expense', dependent: :delete_all

  validates :name, presence: { message: 'PLease complete this field' }
  validates :icon, presence: { message: 'Please complete this field' }

  def total_expenses
    all = 0
    expenses.each { |ex| all += ex.amount }
    all
  end
end

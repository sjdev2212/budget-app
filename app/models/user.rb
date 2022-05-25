class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: { message: 'This field can not be empty' }

  has_many :categories, foreign_key: 'user_id', class_name: 'Category', dependent: :delete_all
  has_many :expenses, foreign_key: 'user_id', class_name: 'Expense', dependent: :delete_all

  def all_expenses
    total = 0
    categories.each { |cat| total += cat.total_expenses }
    total
  end
end

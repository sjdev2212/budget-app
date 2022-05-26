class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates :name, presence: { message: 'This field can not be empty' }
  validates :amount,
            numericality: { only_integer: true, greater_than_or_equal_to: 0,
                            message: 'The input should be greater or equal to 0' }
end

class Category < ApplicationRecord

  ICONS = %w[entertainment groceries utilities housing clothing healthcare transportation miscellaneous].freeze
  belongs_to :user
  has_many :expenses, dependent: :delete_all
  validates :name, presence: true
end

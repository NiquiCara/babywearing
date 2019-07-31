class Carrier < ApplicationRecord
  belongs_to :location
  has_many :loans
  belongs_to :category

  validates :item_id, uniqueness: { message: 'Item ID has already been taken' }
  validates_presence_of [
    :name,
    :item_id,
    :location_id,
    :default_loan_length_days,
    :category_id
  ]

  has_many_attached :photos

  def build_loan(attributes = {})
    loans.create({
      due_date: Date.today + default_loan_length_days.days,
    }.merge(attributes))
  end
end

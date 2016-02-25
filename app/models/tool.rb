class Tool < ActiveRecord::Base
  validates :name, presence: :true
  validates :price, presence: :true
  validates :quantity, presence: :true

  belongs_to :user
  has_many :categories

  def formatted_price
    price / 100.00
  end
end

class Store < ActiveRecord::Base
  has_many :employees
  validates :name, length: { minimum: 3 }
  validates :annual_revenue, numericality: { only_integer: true, greater_than: 0 }
  validate :must_contain_mens_or_womens_apparel

  def must_contain_mens_or_womens_apparel
    errors[:base] << "Store must sell either men's or women's apparel" unless mens_apparel || womens_apparel
  end
end

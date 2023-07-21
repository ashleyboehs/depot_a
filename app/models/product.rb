class Product < ApplicationRecord
  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  validates :title, :description, :image_url, presence: true
  validates :title, length: {minimum: 10}, presence: true
  validates :image_url, allow_blank: true, format: {with: %r{\.(gif|jpg|png)\Z}i, message: "must be a URL for GIF, JPG or PNG image."}
  validates :price, numericality: {greater_than_or_equal_to: 0.01}

  private

# Ensure that there are no line items referencing this Product
  def ensure_net_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, "Line Items present")
      throw :abort
    end
  end
end

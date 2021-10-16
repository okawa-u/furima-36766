class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  # has_one :order
  has_one_attached :image
  belongs_to :category
  belongs_to :status
  belongs_to :fee
  belongs_to :area
  belongs_to :delivery_day

  validates :name, presence: true
  validates :image, presence: true
  validates :explanation, presence: true
  validates :category_id, numericality: { other_than: 1, message: 'must be other than 1' }
  validates :state_id, numericality: { other_than: 1, message: 'must be other than 1' }
  validates :fee_id, numericality: { other_than: 1, message: 'must be other than 1' }
  validates :area_id, numericality: { other_than: 1, message: 'must be other than 1' }
  validates :delivery_day_id, numericality: { other_than: 1, message: 'must be other than 1' }
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :price, format: { with: /\A[0-9]+\z/, message: '半角数字を使用してください' }
end

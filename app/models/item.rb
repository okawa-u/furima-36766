class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  # has_one :order
  has_one_attached :image
  belongs_to :category
  belongs_to :state
  belongs_to :fee
  belongs_to :area
  belongs_to :delivery_day
  has_one    :order

  validates :name, presence: true
  validates :image, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :state_id, presence: true
  validates :fee_id, presence: true
  validates :area_id, presence: true
  validates :delivery_day_id, presence: true
  validates :category_id, numericality: { other_than: 1, message: 'いずれか一つお選びください' }
  validates :state_id, numericality: { other_than: 1, message: 'いずれか一つお選びください' }
  validates :fee_id, numericality: { other_than: 1, message: 'いずれか一つお選びください' }
  validates :area_id, numericality: { other_than: 1, message: 'いずれか一つお選びください' }
  validates :delivery_day_id, numericality: { other_than: 1, message: 'いずれか一つお選びください' }
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :price, format: { with: /\A[0-9]+\z/, message: '半角数字を使用してください' }
end
# numericality=数値のみ(整数のみはonly_integer:trueオプションをつける)
# other_than＝渡した値以外の値でなければならない
# format=withオプションで与えられた正規表現と属性の値がマッチするか

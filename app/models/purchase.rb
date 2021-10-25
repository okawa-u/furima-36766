class Purchase
  include ActiveModel::Model
  attr_accessor :code, :area_id, :muni, :address, :building, :phone, :user_id, :item_id, :token
  # Orderモデルで取り扱えるように

  with_options  presence: true do
    validates :code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :area_id, numericality: { other_than: 0, message: 'を選択してください' }
    validates :muni
    validates :address
    validates :phone, format: { with: /\d{10,11}/ }, length: { maximum: 11 }
    validates :user_id
    validates :item_id
    validates :token
  end
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(code: code, area_id: area_id, muni: muni, address: address, building: building, phone: phone,
                   order_id: order.id)
  end
end

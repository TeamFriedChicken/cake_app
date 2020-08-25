class Member < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :delivery_addresses, dependent: :destroy


  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :kana_first_name, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :kana_last_name, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/}
  validates :address, presence: true
  validates :postcode, format: {with: /\A\d{7}\z/}
  
  def active_for_authentication?
    super && (self.is_delete == false)
  end

  def inactive_message
    self.is_delete? ? super : :special_condition_is_not_valid
  end
end

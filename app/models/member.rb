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
  validates :postcode, length: { is: 7 } , numericality: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, presence: true

  def full_name
		last_name + first_name
  end

  #------------------退会関連-----------------------------------

  def active_for_authentication?
    super && (self.is_delete == false)
  end

  def inactive_message
    self.is_delete? ? super : :special_condition_is_not_valid
  end

   #------------------------------------------------------------

   #------------------住所自動入力関連----------------------------
   include JpPrefecture
   jp_prefecture :prefecture_code

   def prefecture_name
     JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
   end

   def prefecture_name=(prefecture_name)
     self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
   end

  #------------------住所自動入力関連----------------------------

end

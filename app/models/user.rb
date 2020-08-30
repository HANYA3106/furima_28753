class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  PASSWORD_ja = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  PASSWORD_kana = /\A[ァ-ヶー－]+\z/.freeze
  with_options presence: true do
    validates :nickname
    validates :email
    validates :password
    validates :first_name, format: { with: PASSWORD_ja }
    validates :family_name, format: { with: PASSWORD_ja }
    validates :first_name_kana, format: { with: PASSWORD_kana }
    validates :family_name_kana, format: { with: PASSWORD_kana }
    validates :birth_date
  end
  has_one :item_purchases
  has_many :items, dependent: :destroy
end

class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user

  has_one_attached :image
  has_one :item_purchase
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :potage_payer
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :preparation_day
  belongs_to_active_hash :category

  PASSWORD_num = /\A[0-9]+\z/.freeze

  with_options presence: true do
    validates :image, unless: :was_attached? 
    validates :name
    validates :price, format: { with: PASSWORD_num }, inclusion: { in: (300..9_999_999) }
    validates :introduction
    validates :item_condition
    validates :potage_payer
    validates :prefecture
    validates :preparation_day
    validates :category
  end

  validates :item_condition_id, numericality: { other_then: 1 }
  validates :potage_payer_id, numericality: { other_then: 1 }
  validates :prefecture_id, numericality: { other_then: 1 }
  validates :preparation_day_id, numericality: { other_then: 1 }
  validates :category_id, numericality: { other_then: 1 }
end

def was_attached?
  self.image.attached?
end
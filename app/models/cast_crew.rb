class CastCrew < ApplicationRecord
  belongs_to :post

  CastType = { producer: 0, directer: 1, actor: 2 }.freeze
  enum cast_type: CastType

  validates :name, :cast_type, presence: true
end

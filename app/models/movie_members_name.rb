class MovieMembersName < ApplicationRecord
  belongs_to :post

  enum responsible_role: { director: 0, producer: 1, cast: 2, writer: 3 }.freeze

  validates :responsible_role, :cast_name, presence: true
end

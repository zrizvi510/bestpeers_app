class Admin < User
  has_one :picture, as: :imageable
end
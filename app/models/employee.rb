class Employee < User
  has_one :picture, as: :imageable
end
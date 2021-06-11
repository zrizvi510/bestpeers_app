class Profile < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :skills, dependent: :destroy
  validates :date_of_birth, :presence => true
  validate :validate_age

  require 'date'
  
  private
  def validate_age
    if date_of_birth.present? && date_of_birth.to_time.to_i > 18.years.ago.to_i
      errors.add(:date_of_birth, 'You should be under 18 years old.')
    end
  end
end


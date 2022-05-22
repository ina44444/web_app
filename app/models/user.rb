class User < ApplicationRecord
  validates(:name, presence: true)
  has_many :values, dependent: :destroy
  # todo: validations

end

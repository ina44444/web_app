class Theme < ApplicationRecord
  has_many :image



  scope :find_theme_id, -> (theme) { find_by_name(theme).id }
end

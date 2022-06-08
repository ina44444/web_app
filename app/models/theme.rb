class Theme < ApplicationRecord
  has_many :images
  I18n.translate :name

end

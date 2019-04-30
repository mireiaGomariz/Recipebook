class Recipe < ApplicationRecord
  belongs_to :user
  has_attached_file :image, styles: { medium: "22x20", thumb: "50x50" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end

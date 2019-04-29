class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :recipes

  has_attached_file :avatar, styles: { medium: "20x20", thumb: "20x20" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end

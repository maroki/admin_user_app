class User < ApplicationRecord
  paginates_per 20

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  validates :password, confirmation: true, unless: Proc.new { |a| a.password.blank? }
  validates :password_confirmation, presence: true, unless: Proc.new { |a| a.password.blank? }

  validates :email, :full_name, presence: true, length: { maximum: 255 }
  validates :bio, length: { maximum: 1500 }, allow_blank: true

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

end

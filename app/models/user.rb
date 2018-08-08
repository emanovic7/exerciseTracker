class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  :password_confirmation

  has_many :workouts
  has_many :exercises

  has_attached_file :avatar, default_url: ":style/graduation.jpg", styles: { thumb: "50x50>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

end

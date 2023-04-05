class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one_attached :profile_image
  
  has_many :books, dependent: :destroy
  
  def get_profile_image(width, height)
    unless profile_image.atthached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default_image', content_type: 'image/jpg')
    end
    profile_image.variant(resize_to_limit:[width, height]).processed
  end
  
end

class Blog < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :content, :image, presence: true
end

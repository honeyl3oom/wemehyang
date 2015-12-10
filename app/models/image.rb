require 'validator/file_size_validator'
class Image < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  validates :image,
    :presence => true,
    :file_size => {
      :maximum => 10.megabytes.to_i
    }
end

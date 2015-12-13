require 'validator/file_size_validator'
class Tour < ActiveRecord::Base
  default_scope { order("priority ASC") }

  mount_uploader :image, ImageUploader
  validates :image,
    :file_size => {
      :maximum => 40.megabytes.to_i
    }
end

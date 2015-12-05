require 'validator/file_size_validator'
class PsInfo < ActiveRecord::Base
  mount_uploader :main_pension_image, ImageUploader
  mount_uploader :main_tour_image, ImageUploader
  validates :main_pension_image,
    :file_size => {
      :maximum => 40.megabytes.to_i
    }
  validates :main_tour_image,
    :file_size => {
      :maximum => 40.megabytes.to_i
    }
end

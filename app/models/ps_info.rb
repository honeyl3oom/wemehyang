require 'validator/file_size_validator'
class PsInfo < ActiveRecord::Base
  has_secure_password

  mount_uploader :main_pension_image, ImageUploader
  mount_uploader :main_tour_image, ImageUploader

  mount_uploader :top_bg_room_index, TopUploader
  mount_uploader :top_bg_room_detail, TopUploader
  mount_uploader :top_bg_tour, TopUploader
  mount_uploader :top_bg_reservation, TopUploader
  mount_uploader :top_bg_customer, TopUploader

  validates :main_pension_image,
    :file_size => {
      :maximum => 40.megabytes.to_i
    }
  validates :main_tour_image,
    :file_size => {
      :maximum => 40.megabytes.to_i
    }
  validates :top_bg_room_index,
    :file_size => {
      :maximum => 40.megabytes.to_i
    }
  validates :top_bg_room_detail,
    :file_size => {
      :maximum => 40.megabytes.to_i
    }
  validates :top_bg_tour,
    :file_size => {
      :maximum => 40.megabytes.to_i
    }
  validates :top_bg_reservation,
    :file_size => {
      :maximum => 40.megabytes.to_i
    }
  validates :top_bg_customer,
    :file_size => {
      :maximum => 40.megabytes.to_i
    }
end

class City < ActiveRecord::Base

  validates :name, presence: true, length: { maximum: 20 }
  validates :short_name, presence: true, length: { maximum: 3 }

end

class Restaurant < ApplicationRecord
  validates_presence_of :name, :address, :city, :state, :zip
  has_many :reports, dependent: :destroy
end

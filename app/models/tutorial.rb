class Tutorial < ActiveRecord::Base
  belongs_to :mang
  validates_associated :mang
end

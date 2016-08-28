class Mang < ActiveRecord::Base
  include DeviseTokenAuth::Concerns::User
  has_many :tutorials
end

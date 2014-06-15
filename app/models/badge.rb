class Badge < ActiveRecord::Base
  has_many :badginations
  has_many :users, :through => :badginations
end

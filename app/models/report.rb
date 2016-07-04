class Report < ActiveRecord::Base

  belongs_to  :user
  has_many    :paintings
  has_many    :reviews

end

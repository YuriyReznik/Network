class Report < ActiveRecord::Base

  belongs_to  :user
  has_many    :paintings

end

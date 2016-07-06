class Report < ActiveRecord::Base

  belongs_to  :user
  belongs_to  :category
  has_many    :paintings
  has_many    :comments, dependent: :destroy

end

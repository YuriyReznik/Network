class Message < ActiveRecord::Base

    has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100#" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

    belongs_to :user_1, :class_name => 'User'
    belongs_to :user_2, :class_name => 'User'

end

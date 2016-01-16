class Review < ActiveRecord::Base
  belongs_to :place
  belongs_to :user
  #validate_presence_of :content
end

class Review < ActiveRecord::Base
  belongs_to :place
  belongs_to :user
  validates_presence_of :content
  validates_presence_of :score

  # after_save :save_score

  # def save_score
  #   a = self.place.average_rating
  #   self.place.update_attributes(average_rating: a)
  # end  
end

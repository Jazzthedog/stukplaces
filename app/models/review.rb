class Review < ActiveRecord::Base
  belongs_to :place
  belongs_to :user
  validates_presence_of :content
  validates_presence_of :score

  after_save :calculate_average

  def calculate_average
    a = self.place.average_rating
    self.place.update_attributes(total_average_rating: a)
  end  

end

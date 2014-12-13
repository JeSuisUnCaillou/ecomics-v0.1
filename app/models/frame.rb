class Frame < ActiveRecord::Base
  
  belongs_to :ecomic 
 
  validates_presence_of :name
  validates_uniqueness_of :name
  
  validates_presence_of :ecomic
   
end

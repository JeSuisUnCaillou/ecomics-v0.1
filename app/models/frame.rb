class Frame < ActiveRecord::Base
  
  belongs_to :ecomic 
  validates_presence_of :ecomic
 
  validates_presence_of :name
  validates_uniqueness_of :name

  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  #validates_presence_of :picture
   
end

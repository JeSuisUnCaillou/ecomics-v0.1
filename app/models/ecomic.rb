class Ecomic < ActiveRecord::Base

  belongs_to :user

  has_many :frames, dependent: :destroy

  validates_uniqueness_of :name
  validates_presence_of :name

  validates_presence_of :user

  #validates_presence_of :comic_type


end

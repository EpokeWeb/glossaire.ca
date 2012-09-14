class Category < ActiveRecord::Base
  belongs_to :user
  has_many :words, :dependent => :nullify
  has_and_belongs_to_many :glossaries

  validates_presence_of :name
  validates :name, :uniqueness => { :scope => :user_id}

  attr_accessible :name

  default_scope :order => 'name'
end

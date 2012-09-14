class Word < ActiveRecord::Base
  extend FriendlyId

  friendly_id :name, :use => :slugged

  belongs_to :user
  belongs_to :category
  has_and_belongs_to_many :glossaries

  validates_presence_of :name, :slug
  validates :name, :uniqueness => { :scope => :user_id}

  attr_accessible :category_id, :category, :description, :name

  default_scope :order => 'name'

  before_save do
    self.name = self.name.capitalize
  end
end

class Glossary < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :words
  has_and_belongs_to_many :categories

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_format_of :name,
                      :with => /^[a-z0-9\-]*?$/,
                      :message => 'accepts only lower case letters, numbers and hyphens'
  validates :name, 
            :exclusion => { :in => %w(www mail ftp), :message => "Subdomain %{value} is reserved." },
            :length => { :in => 2..15 }

  attr_accessible :name, :word_ids, :category_ids

  def url
    'http://' + self.name + '.' + Rails.application.config.host
  end

  def all_words
    words = self.words
    self.categories.each do |category|
      words += category.words
    end
    words.flatten.uniq.sort_by { |w| w.name }
  end
end

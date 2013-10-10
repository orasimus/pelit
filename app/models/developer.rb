class Developer < ActiveRecord::Base
	validates_presence_of :name
	validates_uniqueness_of :name
	has_many :games, :order => "name"
  
  named_scope :ordered, :order => "name ASC"
  named_scope :by_country, lambda { |c| { :conditions => ["country = ?", c] } }
  
  def self.countries
    Developer.all.map(&:country).uniq.sort!
  end
end

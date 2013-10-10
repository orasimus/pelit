class Game < ActiveRecord::Base
	validates_presence_of :name
	belongs_to :developer
	has_and_belongs_to_many :platforms, :order => "name"
	has_and_belongs_to_many :tags, :order => "name"
	has_many :notes, :dependent => :destroy

  named_scope :ordered, :order => "name ASC"
  named_scope :order_by, lambda { |args|
    {
      :joins => "LEFT JOIN developers d1 ON d1.id = games.developer_id",
      :order =>  "#{args[0]} #{args[1]} #{args[2]}" # column (name) direction
    }
  }
  named_scope :by_tag, lambda { |tag|
    {
      :joins => :tags,
      :conditions => [ "tags.id = ?", tag.id ]
    }
  }
  named_scope :by_developer, lambda { |developers|
    {
      :conditions => [ "developer_id IN (?)", developers.map(&:id) ]
    }
  }
  named_scope :by_year, lambda { |year| { :conditions => ["release_year = ?", year] } }
  named_scope :by_platform, lambda { |platform|
    {
      :joins => :platforms,
      :conditions => [ "platforms.id = ?", platform.id ]
    }
  }
end

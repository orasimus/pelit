class Note < ActiveRecord::Base
	validates_presence_of :type, :content
	belongs_to :game
  
  named_scope :ordered, :order => "content ASC"
end

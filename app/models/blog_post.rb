class BlogPost < ActiveRecord::Base
	attr_accessible :title, :content, :author
end

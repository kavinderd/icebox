class Link < ActiveRecord::Base
 validates_presence_of :url, :title
end

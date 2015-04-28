class Link < ActiveRecord::Base
 enum status: [:unread, :read, :archived, :deleted]
 validates_presence_of :url, :title
 belongs_to :user
end

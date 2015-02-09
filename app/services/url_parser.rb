require "pismo"
class UrlParser

  def self.generate_link(url:, user:)
    doc = Pismo::Document.new(url)
    user.links.build(title: doc.title, url: url).save!
  end

end

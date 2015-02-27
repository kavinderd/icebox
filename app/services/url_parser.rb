require "pismo"
class UrlParser

  def self.generate_link(url:, user:)
    doc = Pismo::Document.new(url)
    link = user.links.build(title: doc.title, url: url)
    if link.save!
      link
    end
  end

end

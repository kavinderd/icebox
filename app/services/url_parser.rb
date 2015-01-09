require "pismo"
class UrlParser

  def self.generate_link(url)
    doc = Pismo::Document.new(url)
    Link.create(title: doc.title, url: url)
  end

end

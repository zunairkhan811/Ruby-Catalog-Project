class Item
  attr_reader :publish_date, :genre, :author, :label, :sources

  def initialize(publish_date)
    @id = Random.rand(1..100)
    @publish_date = publish_date
    @archived = false
    @genres = []
    @authors = []
    @labels = []
    @sources = []
  end

  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  def author=(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def sources=(sources)
    @sources = sources
    sources.items.push(self) unless sources.items.include?(self)
  end
end

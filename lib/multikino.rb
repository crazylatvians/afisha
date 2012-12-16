require "open-uri"

class Multikino

  def initialize date
    @date = date
    @domain_path = "http://www.multikino.lv"
  end

  def get_lv_movies
    @doc = Nokogiri::HTML(open("#{@domain_path}/lv/filmas/riga/#{@date}/"))
    doc_looping(@doc)
  end

  def get_ru_movies
    @doc = Nokogiri::HTML(open("#{@domain_path}/ru/filmas/riga/#{@date}/"))
    doc_looping(@doc)
  end

  private
  
  def doc_looping doc
    doc.css("ul.image-list li").select { |item| item.css("h2 a.title").present? }.map { |item| grab_item(item) }
  end

  def grab_item item
    swowtime = item.css("div.showings a.active").map { |i| DateTime.parse("#{@date} #{i.content.strip}") }
    {
      title:        item.css("h2 a.title").first.content, 
      showings:     swowtime,
      description:  item.css("p.text").first.content.gsub("\n", "").strip,
      url:          "#{@domain_path}#{item.css("a.button-more").first["href"]}"
    }
  end

end
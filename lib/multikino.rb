require 'open-uri'
require 'mechanize'

class Multikino

  def initialize date
    @date = date
    @domain_path = 'http://www.multikino.lv'
    @agent = Mechanize.new
  end

  def get_lv_movies
    page = @agent.get("#{@domain_path}/lv/filmas/riga/#{@date}")
    doc_looping(page)
  end

  def get_ru_movies
    page = @agent.get("#{@domain_path}/ru/filmas/riga/#{@date}")
    doc_looping(page)
  end

  private
  
  def doc_looping doc
    doc.search('ul.image-list li').select { |a| a.css('h2 a.title').present? }.map { |b| grab_item(b) }
  end

  def grab_item item
    swowtime = item.search('div.showings a.active').map { |i| DateTime.parse("#{@date} #{i.content.strip}") }
    {
      title:        item.css("h2 a.title").first.content, 
      showings:     swowtime,
      description:  item.css("p.text").first.content.gsub("\n", "").strip,
      url:          "#{@domain_path}#{item.css("a.button-more").first["href"]}"
    }
  end

end
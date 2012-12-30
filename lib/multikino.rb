require 'open-uri'
require 'mechanize'

class Multikino

  def initialize date
    @date = date
    @domain_path = 'http://www.multikino.lv/lv'
    @agent = Mechanize.new
  end

  def get_showtimes
    page = @agent.get("#{@domain_path}/filmas/riga/#{@date}")
    doc_looping(page)
  end

  private

  def doc_looping doc
    doc.search('ul.image-list li').select { |a| a.css('h2 a.title').present? }.map { |b| grab_item(b) }
  end

  def grab_item item
    swowtime = item.search('div.showings a.active').map { |i| DateTime.parse("#{@date} #{i.content.strip}") }
    
    { title:        item.css("h2 a.title").first.content, 
      showings:     swowtime,
      url:          "#{@domain_path}#{item.css("a.button-more").first["href"]}" }
  end

end

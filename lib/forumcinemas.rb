require 'open-uri'
require 'mechanize'

class Forumcinemas

  def initialize date
    @date = date.strftime('%d.%m.%Y')
    @domain_path = 'http://www.forumcinemas.lv/'
    @agent = Mechanize.new
  end

  def get_lv_movies
    page = @agent.get("#{@domain_path}/Movies/NowInTheatres/?dt=#{@date}&X-Requested-With=XMLHttpRequest")
    # binding.pry
    doc_looping(page)
    # cities.reject! { |c| c.empty? }
  end

  def get_ru_movies
    page = @agent.get("#{@domain_path}/rus/Movies/NowInTheatres/?dt=#{@date}&X-Requested-With=XMLHttpRequest")
    doc_looping(page)
  end

  private
  
  def doc_looping doc
    doc.search('.results .result').map { |a| grab_item(a) }
  end

  def grab_item item
    swowtime = item.search('.tableGradient a').map { |i| DateTime.parse("#{@date} #{i.content.strip}") }
    if swowtime.present?
      {
        title:        item.search('.small_txt .result_h').first.content.gsub('\n', '').strip,
        showings:     swowtime,
        description:  item.search('.small_txt div')[1].content.gsub('\n', '').strip,
        url:          item.search('a.arrowLink').first['href']
      }
    end
  end

end


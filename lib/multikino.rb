class Multikino

  def initialize date = nil
    require "open-uri"
    @date       ||= "2012-12-05"
    @domain_path = "http://www.multikino.lv"
  end

  def get_lv_movies
    @doc = Nokogiri::HTML(open("http://multikino.lv/lv/filmas/riga/#{@date}/"))
    doc_looping(@doc)
  end

  def get_ru_movies
    @doc = Nokogiri::HTML(open("http://multikino.lv/ru/filmas/riga/#{@date}/"))
    doc_looping(@doc)
  end

  private

  def doc_looping doc
    arr = []
    doc.css("ul.image-list li").each do |item|
      swowtime = []
      i = item.css("h2 a.title")
      if i.present?
        item.css("div.showings a.active").each { |st| swowtime << st.content.gsub("\n", "").strip }
        
        arr << {
                  title:        i.first.content, 
                  showings:     swowtime,
                  description:  item.css("p.text").first.content.gsub("\n", "").strip,
                  url:          "#{@domain_path}#{item.css("a.button-more").first["href"]}" 
               }
      end
    end
    arr
  end

end
class MultikinoLv

  def initialize date = nil
    require "open-uri"
    date       ||= "2012-12-05"
    @doc         = Nokogiri::HTML(open("http://multikino.lv/lv/filmas/riga/#{date}/"))
    @domain_path = "http://www.multikino.lv"
  end

  def get_movies
    arr = []
    @doc.css("ul.image-list li").each do |item|
      i = item.css("h2 a.title")
      swowtime = []
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
#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0", "xmlns:atom": "http://www.w3.org/2005/Atom" do
  xml.channel do
    xml.title "Новости учебно-кадрового центра Карьера, г. Таганрог"
    #xml.author "Учебно-кадровый центр Карьера"
    xml.description "Профессиональное обучение и повышение квалификации в Таганроге и Ростовской области."
    xml.link news_rss_url(format: :rss)
    xml.language "ru"
    xml.tag! 'atom:link', :rel => 'self', :type => 'application/rss+xml', :href => news_rss_url(format: :rss)

    for news in @news

      xml.item do
=begin
        if news.title # TODO news doesn't have title
          xml.title news.title
        else
          xml.title ""
        end
=end
        xml.title news.title
        #xml.author "Учебно-кадровый центр Карьера"
        xml.pubDate news.created_at.to_s(:rfc822)
        xml.link news_url(id: news.id)
        xml.guid news_url(id: news.id)

=begin  
        text = news.content
		# if you like, do something with your content text here e.g. insert image tags.
		# Optional. I'm doing this on my website.
      if news.image.exists?
            image_url = news.image.url(:large)
            image_caption = news.image_caption
            image_align = ""
            image_tag = "
                <p><img src='" + image_url +  "' alt='" + image_caption + "' title='" + image_caption + "' align='" + image_align  + "' /></p>
              "
            text = text.sub('{image}', image_tag)
        end
=end
        xml.description news.content

      end
    end
  end
end
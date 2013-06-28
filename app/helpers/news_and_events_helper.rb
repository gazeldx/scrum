module NewsAndEventsHelper
  def link_to_news(news_and_event, args = {}, &block)
    if news_and_event.category == 'Newsletter'
      link_to(news_and_event.title, news_and_event.ref_link, args, &block)
    else
      link_to(news_and_event.title, news_and_event, args, &block)
    end
  end
end

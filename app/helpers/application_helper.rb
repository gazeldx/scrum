module ApplicationHelper
  def title(_title)
    content_for :title do
      _title
    end
  end

  def metadesc(_metadesc)
    content_for :metadesc do
      _metadesc.gsub(/\r\n/,' ').gsub(/['"]/," ")
    end
  end

  def summary(_summary)
    content_for :summary do
      _summary.gsub(/\r\n/,' ').gsub(/['"]/," ")
    end
  end

  def h(_title)
    content_for :h do
      _title
    end
  end
end

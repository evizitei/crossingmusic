class HomePresenter
  def initialize
    @feed = "http://feeds.feedburner.com/Testcmfeed"
  end
  
  def news_feed
    feed = Feedzirra::Feed.fetch_and_parse(@feed)
    feed.entries[0..2].map{|entry| "<h2>#{entry.title}</h2>#{entry.summary}"}.join("<br/><hr/><br/>")
  end
end
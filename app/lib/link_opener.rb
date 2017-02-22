class LinkOpener < CodeRunner
  def run
    board.update! metadata: { type: "link_opener", url: "https://www.nytimes.com/2017/02/16/nyregion/chris-christie-bridgegate.html" }
    super
  end
end

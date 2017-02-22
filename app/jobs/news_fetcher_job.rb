class NewsFetcherJob < ApplicationJob
  queue_as :default

  def perform
    # Do something later
    NewsFetcher.populate "cnn"
  end
end

module BoardHelper
  ACCEPTED_LINKS = {
    Led: ["toggle", "sync_data"],
    Lcd: ["display_string", "sync_data"],
    Screen: ["link_opener", "sync_data"]
  }

  def get_accepted_links board_type
    ACCEPTED_LINKS.with_indifferent_access.fetch(board_type, ["sync_data"])
  end
end

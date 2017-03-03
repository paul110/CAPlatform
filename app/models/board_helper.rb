module BoardHelper
  ACCEPTED_LINKS = {
    led: ["toggle", "sync_data"],
    lcd: ["display_string", "sync_data"],
    screen: ["link_opener", "sync_data"]
  }

  def get_accepted_links board_type
    ACCEPTED_LINKS.with_indifferent_access[board_type]
  end
end

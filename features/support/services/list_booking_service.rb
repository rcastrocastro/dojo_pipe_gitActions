class RequisicaoAPI_GETBooking
  include HTTParty
  base_uri CONFIG['BASE_URI']
  headers CONFIG['API_HEADERS']
  default_timeout 120

  def initialize() end

  def list_booking
    self.class.get('/booking')
  end

  def list_booking_id(id)
    self.class.get("/booking/#{id}")
  end
end

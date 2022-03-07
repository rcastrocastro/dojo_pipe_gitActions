class RequisicaoAPI_DELETEBooking
  include HTTParty
  base_uri CONFIG['BASE_URI']
  headers CONFIG['API_HEADERS']
  default_timeout 120

  def initialize() end

  def delete_booking(token, id)
    self.class.headers 'Cookie' => "token=#{token}"
    self.class.delete("/booking/#{id}")
  end
end

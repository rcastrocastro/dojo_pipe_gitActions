class RequisicaoAPI_Common
  include HTTParty
  base_uri CONFIG['BASE_URI']
  headers CONFIG['API_HEADERS']
  default_timeout 120

  def initialize() end

  def cat_id_booking
    result = self.class.get('/booking').sample
    result['bookingid']
  end
end

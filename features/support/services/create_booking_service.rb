class RequisicaoAPI_POSTBooking
  include HTTParty
  base_uri CONFIG['BASE_URI']
  headers CONFIG['API_HEADERS']
  default_timeout 120

  def initialize() end

  def create_new_booking(payload)
    bookingdates = {}
    bookingdates[:checkin] = payload[:bookingdates][:checkin]
    bookingdates[:checkout] = payload[:bookingdates][:checkout]

    body = {}
    body[:firstname] = payload[:firstname]
    body[:lastname] = payload[:lastname]
    body[:totalprice] = payload[:totalprice]
    body[:depositpaid] = true
    body[:bookingdates] = bookingdates
    body[:additionalneeds] = 'Breakfast'

    p body

    self.class.headers 'Accept' => 'application/json'
    self.class.post('/booking', body: body.to_json)
  end
end

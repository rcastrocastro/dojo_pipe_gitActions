Quando('realizar a requisição GET por ID') do
  id_booking = @service.call(RequisicaoAPI_Common).cat_id_booking
  p "O ID da Reserva a ser consultado é #{id_booking}"
  @response = @service.call(RequisicaoAPI_GETBooking).list_booking_id(id_booking)
end

Então('a API deverá retornar a reserva especificada') do
  expect(@response.code).to eql 200
  expect(@response.message).to eql 'OK'
  p @response.body
  expect(@response.body).to match_json_schema('list_booking_id')
end

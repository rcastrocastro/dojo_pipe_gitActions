Quando('realizar a requisição POST') do
  @payload = FactoryBot.build(:create_booking).to_hash
  @response = @service.call(RequisicaoAPI_POSTBooking).create_new_booking(@payload)
end

Então('a API irá cadastrar a nova reserva') do
  expect(@response.code).to eql 200
  expect(@response.message).to eql 'OK'
  expect(@response.body).to match_json_schema('create_booking')
end

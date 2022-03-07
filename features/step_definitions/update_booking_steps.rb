Quando('realizar a requisição PUT') do
  steps %(
    Quando enviar os dados da requisição do token
  )
  token = @token['token']
  id_booking = @service.call(RequisicaoAPI_Common).cat_id_booking
  @payload = FactoryBot.build(:update_booking).to_hash
  @response = @service.call(RequisicaoAPI_PUTBooking).update_booking(token, id_booking, @payload)
end

Então('a API irá atualizar a reserva especifica') do
  expect(@response.code).to eql 200
  expect(@response.message).to eql 'OK'
  expect(@response.body).to match_json_schema('update_booking')
end

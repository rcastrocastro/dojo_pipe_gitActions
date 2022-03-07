Quando('realizar a requisição GET') do
  @response = @service.call(RequisicaoAPI_GETBooking).list_booking
end

Então('a API irá retornar as reservas cadastradas') do
  expect(@response.code).to eql 200
  expect(@response.message).to eql 'OK'
end

Então('o corpo da resposta deverá conter todos os campos especificados') do
  expect(@response.body).to match_json_schema('list_booking_all')
end

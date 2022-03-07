Quando('realizar a requisição DELETE') do
  steps %(
    Quando enviar os dados da requisição do token
  )
  token = @token['token']
  id_booking = @service.call(RequisicaoAPI_Common).cat_id_booking
  p "O ID que será deletado é: #{id_booking}"
  @response = @service.call(RequisicaoAPI_DELETEBooking).delete_booking(token, id_booking)
end

Então('a API irá deletar a reserva especifica') do
  expect(@response.code).to eql 201
  expect(@response.message).to eql 'Created'
end

#language: pt

Funcionalidade: Consultar as reservas por ID
  Como um usuário do sistema
  Eu quero realizar requisições GET na API
  Para que possa consultar as reservas por ID

@not_run
Cenário: Consulta de usuário por ID
  Quando realizar a requisição GET por ID
  Então a API deverá retornar a reserva especificada
#language: pt

Funcionalidade: Consultar as reservas já cadastradas
  Como um usuário do sistema
  Eu quero realizar requisições GET na API
  Para que possa consultar as reservas cadastradas

Cenário: Consulta lista de reservas
  Quando realizar a requisição GET
  Então a API irá retornar as reservas cadastradas
  E o corpo da resposta deverá conter todos os campos especificados

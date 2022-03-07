class RequisicaoAPI_TOKEN
  include HTTParty
  base_uri CONFIG['BASE_URI']
  headers CONFIG['API_HEADERS']
  default_timeout 120

  def initialize() end

  def generate_token
    body = {}
    body[:username] = ENV['USERNAME_TOKEN']
    body[:password] = ENV['PASSWORD_TOKEN']

    self.class.post('/auth', body: body.to_json)
  end
end

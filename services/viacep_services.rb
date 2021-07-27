module Viacep
  include HTTParty
  base_uri 'viacep.com.br/ws'
  format :json
end

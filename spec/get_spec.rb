verify_sp = { 'cep': '11712-510', 'logradouro': 'Rua dos Carvalhos', 'complemento': '', 'bairro': 'Samambaia',

              'localidade': 'Praia Grande', 'uf': 'SP', 'ibge': '3541000', 'gia': '5587', 'ddd': '13', 'siafi': '6921' }

verify_rj = { "cep": '24241-001', "logradouro": 'Rua Doutor Mário Viana', "complemento": 'de 545 ao fim - lado ímpar', "bairro": 'Santa Rosa',

              "localidade": 'Niterói', "uf": 'RJ', "ibge": '3303302', "gia": '', "ddd": '21', "siafi": '5865' }

describe 'Requisitar dados pelo CEP' do #envia um CEP de São Paulo e valida a resposta
  it 'SP' do
    received = Viacep.get('/11712510/json')
    expect(received.code).to eql 200
    # puts 'Comparação dos dados locais e recebidos'
    verify_sp.each do |key, value|
      expect(received.parsed_response[key.to_s]).to eql value
      # puts "Expected #{key}: #{value}    Received: #{received.parsed_response[key.to_s]}"
    end
    # puts "Code for SP: #{received.code}"
  end
  it 'RJ' do #envia um CEP do Rio de Janeiro e valida a resposta
    received = Viacep.get('/24241001/json')
    expect(received.code).to eql 200
    # puts 'Comparação dos dados locais e recebidos'
    verify_rj.each do |key, value|
      expect(received.parsed_response[key.to_s]).to eql value
      # puts "Expected #{key}: #{value}   Received: #{received.parsed_response[key.to_s]}"
    end
    # puts "Code for RJ: #{received.code}"
  end
end

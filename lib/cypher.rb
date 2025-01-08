require 'openssl'
require 'base64'

class Cypher
  def initialize(key = Rails.application.credentials.encryption[:key], iv = Rails.application.credentials.encryption[:iv])
    @cypher = OpenSSL::Cipher.new('AES-256-CBC')
    @key = key
    @iv = iv
  end

  def self.encrypt(data)
    @cypher.encrypt
    @cypher.key = @key
    @cypher.iv = @iv

    encrypted = @cypher.update(data) + @cypher.final
    Base64.encode64(encrypted)
  end

  def self.decrypt(encrypted_data)
    @cypher.decrypt
    @cypher.key = @key
    @cypher.iv = @iv

    decoded_data = Base64.decode64(encrypted_data)
    @cypher.update(decoded_data) + @cypher.final
  end
end

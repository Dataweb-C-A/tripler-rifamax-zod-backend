class ApplicationController < ActionController::API
  def validates_token
    url = "https://api.rifa-max.com/auth/verify_trz_access"

    token = request.headers['Authorization']

    @token = token.nil? ? nil : token.split(' ').last

    headers = {
      "Content-Type" => "application/json",
      "Authorization" => "Bearer #{@token}"
    }

    request = HTTParty.post(url, headers: headers)
    
    if request.code == 200
      @current_user = JSON.parse(request.body)
    else
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end
end

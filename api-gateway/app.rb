
require 'sinatra'
require 'json'
require 'dotenv/load'
require 'rack/cors'
require_relative './services/gemini_service'

use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: [:post]
  end
end

set :port, 4000

post '/chat' do
  content_type :json
  data = JSON.parse(request.body.read)
  reply = GeminiService.chat(data["message"])
  { reply: reply }.to_json
end

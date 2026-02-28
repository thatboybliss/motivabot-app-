
require 'sinatra'
require 'json'
require 'dotenv/load'
require_relative './services/qwen_service'
require_relative './services/tts_service'

set :port, 5000

post '/speech' do
  content_type :json
  data = JSON.parse(request.body.read)

  processed = QwenService.process(data["text"])
  audio_url = TTSService.generate(processed)

  { reply: processed, audio: audio_url }.to_json
end

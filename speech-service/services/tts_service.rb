
require 'httparty'

class TTSService
  def self.generate(text)
    api_key = ENV['ELEVENLABS_API_KEY']
    voice_id = ENV['ELEVENLABS_VOICE_ID']

    response = HTTParty.post(
      "https://api.elevenlabs.io/v1/text-to-speech/#{voice_id}",
      headers: {
        "xi-api-key" => api_key,
        "Content-Type" => "application/json"
      },
      body: {
        text: text,
        model_id: "eleven_monolingual_v1"
      }.to_json
    )

    file_path = "logs/output.mp3"
    File.open(file_path, "wb") { |f| f.write(response.body) }

    file_path
  end
end

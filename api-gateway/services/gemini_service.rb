
require 'httparty'

class GeminiService
  def self.chat(message)
    api_key = ENV['GEMINI_API_KEY']

    body = {
      contents: [
        {
          role: "user",
          parts: [{ text: message }]
        }
      ]
    }

    response = HTTParty.post(
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=#{api_key}",
      headers: { "Content-Type" => "application/json" },
      body: body.to_json
    )

    response.parsed_response.dig("candidates", 0, "content", "parts", 0, "text")
  end
end

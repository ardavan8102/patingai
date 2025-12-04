from flask import Flask, jsonify, request
from dotenv import load_dotenv
import os
import openai

# Load .env
load_dotenv()
apiKey = os.getenv('API_KEY')
aiModel = os.getenv('AI_MODEL')

# OpenAI
openai.api_key = apiKey

app = Flask(__name__)



@app.route('/ai', methods=['POST'])
def gpt_ai():
  data = request.get_json()

  # User Question
  userMessage = data['message']
  conversation = data.get('conversation', [])

  # add message to conversation list
  conversation.append({
    'role': 'user',
    'message': userMessage
  })

  response = openai.chat.completions.create(
    model = aiModel,
    messages=conversation
  )

  # Ai Answer
  ai_response = response.choices[0].message.content

  return jsonify({'response': str(response)})



if __name__ == '__main__':
  app.run()
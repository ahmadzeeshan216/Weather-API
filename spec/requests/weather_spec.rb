require 'rails_helper'

describe 'WeatherControllerSpec', type: :request do  
  context 'when no locale is set' do
    describe 'temperature' do
      it 'returns response in English' do
        params = {
          degrees: -10
        }
        post '/weather/temperature', params: params, as: :json

        expected = {description: '10 degrees Celsius below zero'}
        expect(response.status).to eq 200
        expect(JSON.parse(response.body)).to eq(expected.stringify_keys)
      end
    end

    describe 'wind' do
      it 'returns response in English' do
        params = {
          wind_speed: 2
        }
        post '/weather/wind', params: params, as: :json

        expected = {description: 'No wind'}
        expect(response.status).to eq 200
        expect(JSON.parse(response.body)).to eq(expected.stringify_keys)
      end
    end

    describe 'clouds' do
      it 'returns response in English' do
        params = {
          clouds: 10
        }
        post '/weather/clouds', params: params, as: :json

        expected = {description: 'Clear weather'}
        expect(response.status).to eq 200
        expect(JSON.parse(response.body)).to eq(expected.stringify_keys)
      end
    end
  end
end

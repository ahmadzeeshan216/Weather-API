require 'rails_helper'

describe 'WeatherControllerSpec', type: :request do
  context 'spanish locale' do
    describe 'temperature' do
      context 'when parameter "degrees" is passed' do
        context 'when degrees is below zero' do
          it 'returns below zero text in Spanish' do
            params = {
              degrees: -10,
              locale: :es
            }
            post '/weather/temperature', params: params, as: :json

            expected = {description: '10 grados centígrados bajo cero'}
            expect(response.status).to eq 200
            expect(JSON.parse(response.body)).to eq(expected.stringify_keys)
          end
        end

        context 'when degrees is zero' do
          it 'returns above zero text in Spanish' do
            params = {
              degrees: 0,
              locale: :es
            }
            post '/weather/temperature', params: params, as: :json

            expected = {description: '0 grados centígrados'}
            expect(response.status).to eq 200
            expect(JSON.parse(response.body)).to eq(expected.stringify_keys)
          end
        end

        context 'when degrees is above zero' do
          it 'returns above zero text in Spanish' do
            params = {
              degrees: 15,
              locale: :es
            }
            post '/weather/temperature', params: params, as: :json

            expected = {description: '15 grados centígrados'}
            expect(response.status).to eq 200
            expect(JSON.parse(response.body)).to eq(expected.stringify_keys)
          end
        end
      end
    end

    describe 'wind' do
      context 'when parameter "wind_speed" is passed' do
        context 'when wind speed is less than 3' do
          it 'returns "No wind" in Spanish' do
            params = {
              wind_speed: 2,
              locale: :es
            }
            post '/weather/wind', params: params, as: :json

            expected = {description: 'Sin viento'}
            expect(response.status).to eq 200
            expect(JSON.parse(response.body)).to eq(expected.stringify_keys)
          end
        end

        context 'when wind speed is less than 8' do
          it 'returns "Light breeze" in Spanish' do
            params = {
              wind_speed: 3,
              locale: :es
            }
            post '/weather/wind', params: params, as: :json

            expected = {description: 'Brisa ligera'}
            expect(response.status).to eq 200
            expect(JSON.parse(response.body)).to eq(expected.stringify_keys)
          end
        end

        context 'when wind speed is less than 20' do
          it 'returns "Windy" in Spanish' do
            params = {
              wind_speed: 8,
              locale: :es
            }
            post '/weather/wind', params: params, as: :json

            expected = {description: 'Clima ventoso'}
            expect(response.status).to eq 200
            expect(JSON.parse(response.body)).to eq(expected.stringify_keys)
          end
        end

        context 'when wind speed is more or equal than 20' do
          it 'returns "Very strong wind" in Spanish' do
            params = {
              wind_speed: 20,
              locale: :es
            }
            post '/weather/wind', params: params, as: :json

            expected = {description: 'Viento muy fuerte'}
            expect(response.status).to eq 200
            expect(JSON.parse(response.body)).to eq(expected.stringify_keys)
          end
        end
      end
    end

    describe 'clouds' do
      context 'when parameter "clouds" is passed' do
        context 'when clouds percentage is less or equal than 10' do
          it 'returns "Clear weather" in Spanish' do
            params = {
              clouds: 10,
              locale: :es
            }
            post '/weather/clouds', params: params, as: :json

            expected = {description: 'Tiempo despejado'}
            expect(response.status).to eq 200
            expect(JSON.parse(response.body)).to eq(expected.stringify_keys)
          end
        end

        context 'when clouds percentage is less or equal than 70' do
          it 'returns "Partially cloudy" in Spanish' do
            params = {
              clouds: 70,
              locale: :es
            }
            post '/weather/clouds', params: params, as: :json

            expected = {description: 'Parcialmente nublado'}
            expect(response.status).to eq 200
            expect(JSON.parse(response.body)).to eq(expected.stringify_keys)
          end
        end

        context 'when clouds percentage is more than 70' do
          it 'returns "Cloudy" in Spanish' do
            params = {
              clouds: 71,
              locale: :es
            }
            post '/weather/clouds', params: params, as: :json

            expected = {description: 'Clima nublado'}
            expect(response.status).to eq 200
            expect(JSON.parse(response.body)).to eq(expected.stringify_keys)
          end
        end
      end
    end
  end
end

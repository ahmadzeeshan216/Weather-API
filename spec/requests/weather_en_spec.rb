require 'rails_helper'

describe 'WeatherControllerSpec', type: :request do  
  context 'english locale' do
    describe 'temperature' do
      context 'when parameter "degrees" is passed' do
        context 'when degrees is below zero' do
          it 'returns below zero text' do
            params = {
              degrees: -10,
              locale: :en
            }
            
            post '/weather/temperature', params: params, as: :json

            expected = {description: '10 degrees Celsius below zero'}
            expect(response.status).to eq 200
            expect(JSON.parse(response.body)).to eq(expected.stringify_keys)
          end
        end

        context 'when degrees is zero' do
          it 'returns above zero text' do
            params = {
              degrees: 0,
              locale: :en
            }
            post '/weather/temperature', params: params, as: :json

            expected = {description: '0 degrees Celsius'}
            expect(response.status).to eq 200
            expect(JSON.parse(response.body)).to eq(expected.stringify_keys)
          end
        end

        context 'when degrees is above zero' do
          it 'returns above zero text' do
            params = {
              degrees: 15,
              locale: :en
            }
            post '/weather/temperature', params: params, as: :json

            expected = {description: '15 degrees Celsius'}
            expect(response.status).to eq 200
            expect(JSON.parse(response.body)).to eq(expected.stringify_keys)
          end
        end
      end

      context 'when parameter "degrees" is not passed' do
        it 'returns 422' do
          params = {
            locale: :en
          }

          post '/weather/temperature', params: params, as: :json
          expect(response.status).to eq 422
        end
      end
    end

    describe 'wind' do
      context 'when parameter "wind_speed" is passed' do
        context 'when wind speed is less than 3' do
          it 'returns "No wind"' do
            params = {
              wind_speed: 2,
              locale: :en
            }
            post '/weather/wind', params: params, as: :json

            expected = {description: 'No wind'}
            expect(response.status).to eq 200
            expect(JSON.parse(response.body)).to eq(expected.stringify_keys)
          end
        end

        context 'when wind speed is less than 8' do
          it 'returns "Light breeze"' do
            params = {
              wind_speed: 3,
              locale: :en
            }
            post '/weather/wind', params: params, as: :json

            expected = {description: 'Light breeze'}
            expect(response.status).to eq 200
            expect(JSON.parse(response.body)).to eq(expected.stringify_keys)
          end
        end

        context 'when wind speed is less than 20' do
          it 'returns "Windy"' do
            params = {
              wind_speed: 8,
              locale: :en
            }
            post '/weather/wind', params: params, as: :json

            expected = {description: 'Windy'}
            expect(response.status).to eq 200
            expect(JSON.parse(response.body)).to eq(expected.stringify_keys)
          end
        end

        context 'when wind speed is more or equal than 20' do
          it 'returns "Very strong wind"' do
            params = {
              wind_speed: 20,
              locale: :en
            }
            post '/weather/wind', params: params, as: :json

            expected = {description: 'Very strong wind'}
            expect(response.status).to eq 200
            expect(JSON.parse(response.body)).to eq(expected.stringify_keys)
          end
        end
      end

      context 'when parameter "wind_speed" is not passed' do
        it 'returns 422' do
          params = {
            locale: :en
          }

          post '/weather/wind', params: params, as: :json
          expect(response.status).to eq 422
        end
      end
    end

    describe 'clouds' do
      context 'when parameter "clouds" is passed' do
        context 'when clouds percentage is less or equal than 10' do
          it 'returns "Clear weather"' do
            params = {
              clouds: 10,
              locale: :en
            }
            post '/weather/clouds', params: params, as: :json

            expected = {description: 'Clear weather'}
            expect(response.status).to eq 200
            expect(JSON.parse(response.body)).to eq(expected.stringify_keys)
          end
        end

        context 'when clouds percentage is less or equal than 70' do
          it 'returns "Partially cloudy"' do
            params = {
              clouds: 70,
              locale: :en
            }
            post '/weather/clouds', params: params, as: :json

            expected = {description: 'Partially cloudy'}
            expect(response.status).to eq 200
            expect(JSON.parse(response.body)).to eq(expected.stringify_keys)
          end
        end

        context 'when clouds percentage is more than 70' do
          it 'returns "Cloudy"' do
            params = {
              clouds: 71,
              locale: :en
            }
            post '/weather/clouds', params: params, as: :json

            expected = {description: 'Cloudy'}
            expect(response.status).to eq 200
            expect(JSON.parse(response.body)).to eq(expected.stringify_keys)
          end
        end
      end

      context 'when parameter "clouds" is not passed' do
        it 'returns 422' do 
          params = {
            locale: :en
          }

          post '/weather/clouds', params: params, as: :json
          expect(response.status).to eq 422
        end
      end
    end
  end
end

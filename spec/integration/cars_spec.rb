require 'swagger_helper'

describe 'Cars API' do
    
    path '/api/v1/cars' do
        post 'Crea un Automovil' do
            tags 'Cars'
            consumes 'application/json', 'application/xml'
            parameter name: :car, in: :body, schema: {
                type: :object,
                properties: {
                    nombre: { type: :string },
                    foto_url: { type: :string },
                    status: { type: :boolean }
                },
                required: [ 'nombre', 'status' ]
            }

            response '201', 'Automovil creado' do
                let(:car) { { nombre: 'Marca', status: true } }
                run_test!
            end

            response '422', 'invalid request' do
                let(:car) { { nombre: 'fail' } }
                run_test!
            end
        end 
    end

    path '/api/v1/cars/{id}' do
        get 'Retorna un Automovil' do
            tags 'Cars'
            produces 'application/json', 'application/xml'
            parameter name: :id, :in => :path, :type => :string

            response '200', 'name found' do
                schema type: :object,
                properties: {
                    id: { type: :integer },
                    nombre: { type: :string },
                    foto_url: { type: :string },
                    status: { type: :boolean }
                },
                required: [ 'id', 'nombre', 'status' ]
                let(:id) { Car.create(nombre: 'ford', status: false, foto_url: 'foto_carro.jpg').id }
                run_test!
            end

            response '404', 'Automovil no encontrado' do
                let(:id) { 'invalid' }
                run_test!
            end
        end
    end
end
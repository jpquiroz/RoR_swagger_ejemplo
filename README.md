# README
# RoR_swagger_ejemplo

Ejemplo de documentación de una Api con swagger en Ruby On Rails, usando la gema rswag.

* Requisitos:
Rails 6 >=
ruby  2.7 >=
rswag


* Instalación:

bundle install

rails generate rspec:install

rails g rswag:install

rake db:migrate

rake rswag:specs:swaggerize

rails server

Si todo esta Ok, podrás ver la Api funcionando en: http://127.0.0.1:3000/api-docs


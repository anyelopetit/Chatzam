# Chatzam

Chatzam es una aplicación piloto de ejemplo desarrollada en Ruby on Rails con React, utilizando la gema [react_on_rails](https://github.com/shakacode/react_on_rails) y ActionCable que viene integrado nativamente en Ruby on Rails, con la finalidad de usar webpacker para hacer de esta aplicación lo más reactiva y en tiempo real posible.

* Ruby -v 2.5.1
* Rails -v 5.2.3

### Dependencias
* [React on Rails -v 9.0.1](https://github.com/shakacode/react_on_rails) # Para integrar React sobre Rails
* PostgreSQL # Como el adaptador de Base de Datos para ActiveRecord
* Puma # Como el servidor de la aplicación
* Sass Rails # Para usar SCSS como procesador de estilos
* Uglifier # Como compresor de Javascript
* [Webpacker](https://github.com/rails/webpacker) # Para transpilar JavaScript.
* Coffee Rails # Para usar CoffeeScript como procesador de Javascript
* [Turbolinks -v 5](https://github.com/turbolinks/turbolinks) # Para hacer de la navegación de la aplicación mucho más rápida
* Jbuilder # Para construir APIs con formato JSON con mayor facilidad
* Redis -v 4.0 # Adaptador para correr Action Cable en producción
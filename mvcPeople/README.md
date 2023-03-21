# Módulo CRUD con PHP y MySQL usando el patrón MVC (Modelo Vista Controlador)

El proyecto subido a este Git crea, edita y lista registros para la entidad `users`, usando PHP, MySQL y Bootsrap 5.3.

![Imagen de la página inicial del proyecto](/mvcPeople/project.png)

A continuación se detallan los pasos a seguir para un modelo CRUD completo:

## 1. Crear la base de datos MySQL

Primero, debemos crear una base de datos en MySQL con una tabla que contenga los campos de la entidad que se desea crear o editar. 

Por ejemplo, si se desea crear un módulo para crear/editar usuarios, se puede crear una tabla llamada `users` con los campos `dni`, `name`, `email` y `password`.

## 2. Crear la estructura del proyecto MVC

Para crear la estructura del proyecto MVC, se deben crear tres carpetas principales: `Model`, `View` y `Controller`.

- Dentro de la carpeta `Model` creamos un archivo PHP que contiene la clase que maneja la conexión a la base de datos y las operaciones CRUD (Crear, Leer, Actualizar, Eliminar) de la entidad. 
- Dentro de la carpeta `View`, creamos un archivo PHP que contiene el formulario para crear y editar la entidad. 
- Dentro de la carpeta `Controller`, se crea un archivo PHP que contiene la lógica del negocio para manejar las solicitudes del usuario y llamar a los métodos del modelo correspondientes.

## 3. Crear la clase del modelo

La clase del modelo debe tener un método para conectarse a la base de datos, así como métodos para realizar operaciones CRUD en la tabla de la entidad.

Por ejemplo, la clase para la entidad "users" podría tener los siguientes métodos:

- connection(): para conectarse a la base de datos.
- createUser($dni, $name, $email, $password): para crear un nuevo usuario.
- listUser($dni): para leer un usuario específico.
- listUsers(): listar todos los usuarios.
- updateUser($dni, $name, $email, $password): para actualizar un usuario existente.
- deleteUser($dni): para eliminar un usuario existente.

## 4. Crear la vista del formulario

La vista del formulario debe contener los campos de entrada necesarios para crear o editar la entidad.

Por ejemplo, para el formulario de creación de usuarios, se podría utilizar los siguientes campos: `dni`, `name`, `email` y `password`. Además, se debe agregar un botón para enviar el formulario.

## 5. Crear el controlador

El controlador debe recibir los datos del formulario, validarlos y llamar a los métodos correspondientes del modelo para crear o actualizar la entidad en la base de datos. También debe mostrar la vista del formulario en caso de que se necesite crear o editar la entidad.

Por ejemplo, el controlador para la entidad `users` podría tener los siguientes métodos:

- showView(): para mostrar la vista del formulario.
- processDataForm(): para procesar los datos del formulario y llamar a los métodos correspondientes del modelo.


## 6. Integrar todo

Finalmente, se debe integrar todo el proyecto para que funcione correctamente.

Por ejemplo, el archivo `index.php` podría ser el archivo principal que incluye los archivos necesarios para el modelo, la vista y el controlador. Además, se debe asegurar de que la conexión a la base de datos esté establecida antes de llamar a los métodos del modelo.
<p align="center">
    <a href="https://github.com/yiisoft" target="_blank">
        <img src="https://avatars0.githubusercontent.com/u/993323" height="100px">
    </a>
    <h1 align="center">Yii 2 Proyecto Integrador UTP</h1>
    <br>
</p>


CLONAR PROYECTO A MAQUINA LOCAL
-------------------
        git clone https://github.com/albinrk10/manbus.git         Para clonar proyecto del repositorio
        git pull                                                            Para bajar cambios del repositorio  
        git status                                                          Para ver los archivos que tiene cambios realizados
        git add .                                                           Para agregar todos los archivos modificados/nuevos a memoria
        git commit -m '<comentario del cambio>'                             Para agregar un comentario para subir
        git push                                                            Para Mandar cambios al repositorio  


Mantenimiento contiene las funciones básicas que incluyen el inicio / cierre de sesión del usuario y módulos para su uso en una empresa local.

DIRECTORY STRUCTURE
-------------------

      assets/             contains assets definition
      commands/           contains console commands (controllers)
      config/             contains application configurations
      controllers/        contains Web controller classes
      mail/               contains view files for e-mails
      models/             contains model classes
      runtime/            contains files generated during runtime
      tests/              contains various tests for the basic application
      vendor/             contains dependent 3rd-party packages
      views/              contains view files for the Web application
      web/                contains the entry script and Web resources


REQUIREMENTS
------------

El requisito mínimo de esta plantilla de proyecto es que su servidor web sea compatible con PHP 5.4.0.

### Database

Edit the file `config/db.php` with real data, for example:

```php
return [
    'class' => 'yii\db\Connection',
    'dsn' => 'mysql:host=localhost;dbname=pagina',
    'username' => 'root',
    'password' => '1234',
    'charset' => 'utf8',
];
```

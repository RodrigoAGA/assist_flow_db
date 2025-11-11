# assist_flow_db

# ⚙️ Backend: Assist_Flow_DB - (Ruby/Sinatra & PostgreSQL)

Este proyecto backend expone la API REST que consume nuestra aplicación móvil (Flutter/Dart) y gestiona la base de datos.

## 💡 Tecnologías Centrales

* **Lenguaje:** Ruby (versión 3.4+)
* **Base de Datos:** PostgreSQL (Puerto: 5433)
* **ORM:** Sequel
* **Servidor Web:** Sinatra

---

## 🛠️ Guía de Configuración Rápida

Sigue estos pasos en orden para poner el servidor a funcionar.

### Paso 1: Instalación de Herramientas

1.  **Instalar Ruby:** Usa **RubyInstaller** y, al finalizar, ejecuta `ridk install 3` en una consola **ejecutada como administrador**.
2.  **Instalar PostgreSQL:** Descargue el instalador. **Establezca la contraseña del superusuario (`postgres`) y anótela.**
3.  **Configuración del Servidor:**
    * Verifique en pgAdmin que el servidor esté en el puerto **5433**.
    * Cree una base de datos llamada **`assist_flow_db`**.

### Paso 2: Configurar el Proyecto

1.  **Clonar el Repositorio:**
    ```bash
    git clone [https://aws.amazon.com/es/what-is/repo/](https://aws.amazon.com/es/what-is/repo/)
    cd [NOMBRE DEL PROYECTO]
    ```
2.  **Instalar Dependencias:** Este comando instalará la gema `pg` (PostgreSQL adapter).
    ```bash
    bundle install
    ```
3.  **Ajustar la Conexión:** Abra el archivo `config/database.rb` y **ajuste el valor `password: 'admin',`** a la contraseña que configuró para su usuario `postgres`.

### Paso 3: Migrar y Sembrar la Base de Datos

Hemos encontrado que la migración de tablas puede fallar si no hay una limpieza previa.

1.  **Limpieza de Migraciones (Solo si ya intentaste migrar antes):** Si en algún momento la migración falló, es necesario limpiar las tablas manualmente en pgAdmin.
2.  **Ejecutar Setup Completo:** Este comando crea las tablas si no existen (`db:migrate`) y luego las pobla con los datos iniciales (`:seed`).

    ```bash
    bundle exec rake db:setup
    ```

### Paso 4: Iniciar el Servidor API

El servidor se iniciará en modo desarrollo, recargándose automáticamente con cambios de código.

```bash
bundle exec rerun app.rb



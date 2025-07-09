FROM postgres:16

# Установим переменные окружения (можно переопределить в docker-compose)
ENV POSTGRES_DB=foodies
ENV POSTGRES_USER=backend
ENV POSTGRES_PASSWORD=password

# Копируем дамп в специальную папку, которую PostgreSQL запускает при инициализации
COPY init.sql /docker-entrypoint-initdb.d/

# Для першого запуску потрібно виконати
```
docker-compose up --build -d
```
(має створитися папка pgdata, після здачи роботи - папку можно видаляти)

підключення до БД описано у файлі back/.env-example
```
DATABASE_DIALECT=postgres
DATABASE_USERNAME=backend
DATABASE_PASSWORD=password
DATABASE_HOST=localhost
DATABASE_NAME=foodies
DATABASE_PORT=5432
DATABASE_SSL=no
DATABASE_SYNC=yes
```
БД наповнена первинними даними

# Зупинка контейнера 
```
docker stop foodies_db
```

# Запуск контейнера 
```
docker start foodies_db
```

# Видалення контейнера 
```
docker rm foodies_db
```


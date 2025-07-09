# Для першого запуску потрібно виконати
```
docker-compose up --build -d
```
(має створитися папка pgdata)

підключення до БД описано у файлі back/.env-example
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


# 5 Round  :: Foodies API

Welcome to the **5 Round :: Foodies API** documentation. This RESTful API provides functionality for a social recipe platform where users can register, manage recipes, interact with ingredients, follow other users, and more.

📘 **Live API Docs (Swagger UI):**  
[https://foodies-backend-gpql.onrender.com/api-docs/](https://foodies-backend-gpql.onrender.com/api-docs/)

---

## Authentication

This API uses **JWT Bearer tokens** for authentication.

- To obtain a token, a user must login via `POST /users/login`
- The token must be included in the `Authorization` header for authenticated routes:

```
Authorization: Bearer <your_token_here>
```

---

## Base URLs

- **Production:** `https://foodies-backend-gpql.onrender.com/api`
- **Test:** `https://test-xe0u.onrender.com/api`
- **Local:** `http://127.0.0.1:3000/api`

---

##  Key Endpoints

###  Users

- `POST /users/register` — Register a new user
- `POST /users/login` — Login and receive a JWT token
- `GET /users/me` — Get current user info *(requires auth)*
- `POST /users/logout` — Logout user *(requires auth)*
- `PATCH /users/avatar` — Upload avatar *(requires auth)*
- `GET /users/{id}` — Get public info of a user
- `GET /users/{id}/followers` — Get followers of a user *(requires auth)*
- `GET /users/followees` — Get users followed by the current user *(requires auth)*
- `POST /users/followees/{id}` — Follow a user *(requires auth)*
- `DELETE /users/followees/{id}` — Unfollow a user *(requires auth)*

---

###  Recipes

- `GET /recipes` — List or filter recipes
- `POST /recipes` — Create a new recipe *(requires auth)*
- `GET /recipes/popular` — Get popular recipes
- `GET /recipes/favorites` — Get current user's favorite recipes *(requires auth)*
- `GET /recipes/my` — Get recipes created by current user *(requires auth)*
- `GET /recipes/{id}` — Get a recipe by ID
- `DELETE /recipes/{id}` — Delete your recipe *(requires auth)*
- `POST /recipes/{id}/favorite` — Add to favorites *(requires auth)*
- `DELETE /recipes/{id}/favorite` — Remove from favorites *(requires auth)*

---

###  Categories, Areas, Ingredients

- `GET /categories` — Get all recipe categories
- `GET /areas` — Get all geographical areas
- `GET /ingredients` — Get all ingredients

---

###  Testimonials

- `GET /testimonials` — Retrieve all user testimonials

---

##  Example Auth Flow

1. **Register**
```bash
curl -X POST https://foodies-backend-gpql.onrender.com/api/users/register \
-H "Content-Type: application/json" \
-d '{ "name": "Alice", "email": "alice@example.com", "password": "password123" }'
```

2. **Login**
```bash
curl -X POST https://foodies-backend-gpql.onrender.com/api/users/login \
-H "Content-Type: application/json" \
-d '{ "email": "alice@example.com", "password": "password123" }'
```

3. **Authenticated Request**
```bash
curl -X GET https://foodies-backend-gpql.onrender.com/api/users/me \
-H "Authorization: Bearer <your_token_here>"
```


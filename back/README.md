# add Recepie Test Info

цей рідмі може бути видалений

в addRecipeController розкоментувати

```
const ownerId = 1;
```

і закоментувати

```
сonst ownerId = req.user.id;
```

# recipesRouter має виглядати так після того як отримаєм фуункцію auth та validateBody

```
//recipesRouter.post("/", auth, validateBody(recipeSchema), addRecipeController);
```

# на разі використовую скорочену версію

```
recipesRouter.post("/", addRecipeController);
```

# Для тесту users та ingredients мають мати дінні

# Підготовка даних у базі

```
INSERT INTO users (id, email, name, password, avatar, "createdAt", "updatedAt")
VALUES (
  1,
  'test@example.com',
  'Test User',
  'password',
  'https://example.com/avatar.jpg',
  NOW(),
  NOW()
);
```

```
INSERT INTO ingredients (id, name, "desc", img)
VALUES (
  1,
  'Test Ingredient',
  'Test description',
  'https://example.com/ingredient.jpg'
);
```

# Тестовий POST-запит у Postman

post
http://localhost:3000/api/recipes

```
{
  "title": "test",
  "category": "main",
  "area": "europe",
  "instructions": "Mix all",
  "description": "Test recipe",
  "thumb": "https://example.com/image.jpg",
  "time": "30",
  "ingredients": [
    { "id": "1", "measure": "100g" }
  ]
}
```

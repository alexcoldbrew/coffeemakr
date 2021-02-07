# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
    - used Ruby on Rails.

- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
    - User has_many Recipes, Recipe has_many Reviews.

- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
    - Recipe belongs_to User, Review belongs_to User and belongs_to Recipe.

- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
    - User has_many Reviewed_Recipes through Reviews, Recipe has_many Users through Reviews.

- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
    - Recipe has_and_belongs_to_many Ingredients, Ingredient has_and_belongs_to_many Recipes.

- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
    - Reviews joins between user and recipe

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
    - validating User username and email presence and uniqueness (has_secure_password deals with the password)
    - validating Recipe name, description, and date_created presence
    - validating Ingredient name presence and uniqueness (one want ONE of every ingredient created)
    - validating Review content and rating presence

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
    - Recipe.alphabetize URL: /recipes/\
    - Ingredient.alphabetize URL: /recipe/new

- [x] Include signup (how e.g. Devise)
    - User must use the form to sign up before they can log in.

- [x] Include login (how e.g. Devise)
    - User must log in before they can access anything besides signup, login, or home page.

- [x] Include logout (how e.g. Devise)
    - Users may click the logout link to clear their session and log out.

- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
    - User may be created through OmniAuth Google login (or simply login if User was already created)

- [x] Include nested resource show or index (URL e.g. users/2/recipes)
    - nested ingredients index in recipes, URL: /recipes/6/ingredients

- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
    - nested reviews new in recipes, URL: /recipes/6/reviews/new

- [x] Include form display of validation errors (form URL e.g. /recipes/new)
    - some forms displaying validation errors: /signup and /login


Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
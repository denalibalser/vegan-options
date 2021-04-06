# Vegan Options

## Summary 
I created a web-based Rails application that serves the purpose of providing users with a submission-generated list of vegan friendly restaurants sorted by state. User’s are able to signup or signin (either manually or with the help of OAuth through Facebook), see their profile (which houses their information as well as any restaurants they may have submitted), go to the index page for states (each of which is a link to an index of the restaurants that have been submitted for that state), view the show page for an individual restaurant and create a review for it, create a restaurant submission, or logout. Further, users are able to edit restaurants and reviews that they submitted (only if they submitted them) as well as edit their own profile information.

## Blog 
[Link to Blog Post](https://denalibalser.github.io/rails_project_blog)

Specs:

[x] Using Ruby on Rails for the project
[x]Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
[x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
[x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
[x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
[x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
[x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
[x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
[x] Include signup
[x] Include login
[x] Include logout
[x] Include third party signup/login (how e.g. Devise/OmniAuth)
[x] Include nested resource show or index (URL e.g. users/2/recipes)
[x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
[x] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:

[?] The application is pretty DRY
[?] Limited logic in controllers
[x] Views use helper methods if appropriate
[x] Views use partials if appropriate

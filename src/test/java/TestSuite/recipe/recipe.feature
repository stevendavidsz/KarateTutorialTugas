Feature: Test receipes

  Background:
    * url 'https://api.spoonacular.com'
    * def apiKey = '5cedc908127f4403a9592025d76f2375'
    * def username = 'tipen01'
    * def hash = 'a6e8f7d1ec2b33c46b959578ebf0e5ed44aef21a'
    * def header =
    """
    {
    "Content-Type": "application/json"
    }
    """

  Scenario: Search Recipes
    Given path 'recipes/complexSearch'
    And param apiKey = apiKey
    And request header
    When method get
    * print response
    Then status 200

  Scenario: Search Recipes by Nutrients
    Given path '/recipes/findByNutrients'
    And param minCarbs = 10
    And param maxCarbs = 50
    And param number = 2
    And param apiKey = apiKey
    And request header
    When method get
    * print response
    Then status 200

  Scenario: Search Recipes by Ingredients
    Given path '/recipes/findByIngredients'
    And param ingredients = 'apple', 'flour', 'sugar'
    And param number = 2
    And param apiKey = apiKey
    And request header
    When method get
    * print response
    Then status 200

  Scenario: Get Recipe Information
    Given path '/recipes/716429/information'
    And param includeNutrition = false
    And param apiKey = apiKey
    And request header
    When method get
    * print response
    Then status 200

  Scenario: Get Recipe Information Bulk
    Given path '/recipes/informationBulk'
    And param ids = 715538,716429
    And param includeNutrition = false
    And param apiKey = apiKey
    And request header
    When method get
    * print response
    Then status 200

  Scenario: Get Similar Recipes
    Given path '/recipes/715538/similar'
    And param apiKey = apiKey
    And request header
    When method get
    * print response
    Then status 200

  Scenario: Get Random Recipes
    Given path '/recipes/random'
    And param number = 1
    And param include-tags = 'vegetarian, dessert'
    And param exclude-tags = 'quinoa'
    And param apiKey = apiKey
    And request header
    When method get
    * print response
    Then status 200
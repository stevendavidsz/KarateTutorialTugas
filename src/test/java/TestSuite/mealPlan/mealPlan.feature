Feature: Test Meal Plan
  Background:
    * url 'https://api.spoonacular.com/mealplanner'
    * def apiKey = '352a139b5476474b8ad5d8d90c557b2f'
    * def username = 'stevendavidsz'
    * def hash = '059e3177efb4407dbf1fe5db05c8c4ac26517915'
    * def startDate = '2024-03-25'
 #  * def password = 'reducedfatpeanutbutterwith8lowfatcheese'
 #  * grant_type --> Oauth 2.0
 #  * client_id --> Oauth 2.0 / Bearer token
 #  * client_secret --> Oauth 2.0 / Bearer Token

#   Code untuk auth
#   And auth username, password

  Scenario: Test generate meal plan
    Given path 'generate'
    And param apiKey = apiKey
    When method get
    Then status 200
    And print 'Response:', response

  Scenario: Test add to meal plan
    Given path username, 'items'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And param hash = hash
    And request
    """
    {
    "date": 1711522068,
    "slot": 1,
    "position": 0,
    "type": "INGREDIENTS",
    "value": {
        "id": 296213,
        "servings": 2,
        "title": "Spinach Salad with Roasted Vegetables and Spiced Chickpea",
        "imageType": "jpg",
      }
    }
    """
    When method post
    Then status 200
    And match response.status == 'success'

  Scenario: Test meal plan by week
    Given path username, 'week',startDate
    And param apiKey = apiKey
    And param hash = hash
    When method get
    Then status 200
    And print 'Response:', response

  Scenario: Delete from meal plan
    Given path username, 'items','25627626'
    And param apiKey = apiKey
    And param hash = hash
    When method delete
    Then status 200
    And match response.status == 'success'
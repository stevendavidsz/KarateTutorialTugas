Feature:
  Background:
    * url 'https://api.spoonacular.com/food'
    * def apiKey = '352a139b5476474b8ad5d8d90c557b2f'
    * def username = 'stevendavidsz'
    * def hash = '059e3177efb4407dbf1fe5db05c8c4ac26517915'

  Scenario: Test Random food joke
    Given path 'jokes/random'
    And param apiKey = apiKey
    When method get
    Then status 200
    And print 'Response:', response

  Scenario: Detect food in text
    Given path 'detect'
    And header Content-Type = 'application/x-www-form-urlencoded'
    And param text = 'Banana cake tuku'
    And param apiKey = apiKey
    When method post
    Then status 200
    And print 'Response:', response

  Scenario: Test image analysis by URL
    Given path 'images/analyze'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And param imageUrl = 'https://img.spoonacular.com/recipes/635350-240x150.jpg'
    When method get
    Then status 200
    And print 'Response:', response
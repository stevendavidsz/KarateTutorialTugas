Feature: Pet Module

  Background:
    Given url "https://petstore.swagger.io/v2"
    And print "--Connect petstore API--"

  Scenario: Add Pet to Store
    * def body = '{ "id": 0001,"category": {"id": 0001,"name": "string" },"name": "doggie",  "photoUrls": ["string" ],  "tags": [  {  "id": 0001,  "name": "string"  }  ],  "status": "available"  }'
    When url "https://petstore.swagger.io/v2/pet"
    When method post
    And request body
    Then print response
    And status 200


  Scenario: Get Pet by ID
    When url "https://petstore.swagger.io/v2/pet/10"
    When method get
    Then print response
    And status 200

  Scenario: Get Pet by Status
    When url "https://petstore.swagger.io/v2/pet/findByStatus"
    And params {status:available}
    When method get
    Then print response
    And status 200

  Scenario: Delete Pet
    When url "https://petstore.swagger.io/v2/pet/10"
    And params {status:available}
    When method delete
    Then print response
    And status 200

  Scenario: Check Pet by ID after delete
    When url "https://petstore.swagger.io/v2/pet/10"
    When method get
    Then print response
    And status 404
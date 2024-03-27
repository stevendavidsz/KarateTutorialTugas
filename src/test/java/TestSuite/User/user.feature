Feature: User Module

  Background:
    Given url "https://petstore.swagger.io/v2"
    And print "--Connect petstore API--"

  Scenario: Create list of users with given input array (Create with list)
    Given request [{id: 001, username: "tipen", firstName: "tipen", lastName: "kasep", email: "tipen@gmail.com", password: "test@123", phone: "087873821613", userStatus: 0}]
    When url "https://petstore.swagger.io/v2/user/createWithList"
    When method post
    Then print response
    And status 200

  Scenario: Get user by username
    When url "https://petstore.swagger.io/v2/user/string"
    When method get
    Then print response
    And status 200

  Scenario: Get user login
    When url "https://petstore.swagger.io/v2/user/login"
    When method get
    Then print response
    And status 200

  Scenario: Update User
    * def body = {id: 001, username: "tipens", firstName: "tipen", lastName: "kaseph", email: "tipens@gmail.com", password: "test@123", phone: "087873821603", userStatus: 0}
    When url "https://petstore.swagger.io/v2/user/tipens"
    And request body
    When method put
    Then print response
    And status 200

  Scenario: Delete user
    When url "https://petstore.swagger.io/v2/user/tipens"
    When method delete
    Then print response
    And status 200

  Scenario: Get user logout
    When url "https://petstore.swagger.io/v2/user/logout"
    When method get
    Then print response
    And status 200

  Scenario: Create list of users with given input array (Create with array)
    Given request [{id: 002, username: "tipeni", firstName: "tipenih", lastName: "kasepih", email: "tipenih@gmail.com", password: "testih@123", phone: "087873821613", userStatus: 0}]
    When url "https://petstore.swagger.io/v2/user/createWithArray"
    When method post
    Then print response
    And status 200

  Scenario: Create user
    Given request {id: 003, username: "tipenoh", firstName: "tipeneh", lastName: "kasepih", email: "tipeneh@gmail.com", password: "test@123", phone: "087873821613", userStatus: 0}
    When url "https://petstore.swagger.io/v2/user"
    When method post
    Then print response
    And status 200
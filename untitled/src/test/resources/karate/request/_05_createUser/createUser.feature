Feature: Service client POST
  As QA automation
  I want to create a user
  To validate the status code and response

  Background: consume service
    * url url

  Scenario: check the service POST Method
    * def requestPost = read('classpath:karate/request/_05_createUser/requestPostUser.json')
    * def responsePost = read('classpath:karate/request/_05_createUser/responsePostUser.json')

    Given path 'user','createWithArray'
    And request requestPost
    When method post
    Then status 200
    And match response == responsePost


  Scenario Outline: Post a user with invalid status values

    * def id = '<id>'
    * def responsePost = read('classpath:karate/request/_05_createUser/responsePostUser.json')

    Given path 'user','createWithArray'
    And request

    """
    [
  {
    "id": "<id>",
    "username": "mateoTester",
    "firstName": "Mateo",
    "lastName": "Castillo",
    "email": "mateocastillo64@gmail.com",
    "password": "thisistheway",
    "phone": "25532522",
    "userStatus": 1
  }
]
    """

    When method post
    Then status 500
    And match response == responsePost

    Examples:
      | id       |
      | testing1 |
      | +-*/*-   |



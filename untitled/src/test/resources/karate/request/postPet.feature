Feature: Service client POST
  As QA automation
  I want to create a pet
  To validate the status code and response

  Background: consume service
    * url url

  Scenario: check the service POST Method
    * def requestPost = read('classpath:karate/request/requestPost.json')
    * def responsePost = read('classpath:karate/request/responsePost.json')

    Given path 'pet'
    And request requestPost
    When method post
    Then status 200
    And match response == responsePost
    And assert response.id == requestPost.id
    And assert response.name == requestPost.name
    And assert response.status == requestPost.status
    And assert response.category.id == requestPost.category.id
    And assert response.category.name == requestPost.category.name
    And assert response.tags.id == requestPost.tags.id
    And assert response.tags.name == requestPost.tags.name


  Scenario Outline: Post a pet with invalid status values
    * def idPet = '<status>'
    * def responsePost = read('classpath:karate/request/responsePost.json')

    Given path 'pet'
    And request
    """
    {
  "id": 2456,
  "category": {
    "id": 600,
    "name": "Dog"
  },
  "name": "Willy",
  "photoUrls": [
    "String"
  ],
  "tags": [
    {
      "id": 0,
      "name": "Doggie "
    }
  ],
  "status": "<status>"
}
    """
    When method post
    Then status 200
    And match response == responsePost

    Examples:
      | status     |
      | buying     |
      | 1234567890 |
      | 3.1416     |
      | +-*/       |
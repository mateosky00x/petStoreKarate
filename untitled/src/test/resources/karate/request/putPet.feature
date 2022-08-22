Feature: Service client PUT
  As QA automation
  I want to update a pet
  To validate the status code and response

  Background: consume service
    * url url

  Scenario: check the service PUT Method
    * def requestPut = read('classpath:karate/request/requestPut.json')
    * def responsePut = read('classpath:karate/request/responseGet.json')


    Given path 'pet'
    And request requestPut
    When method put
    Then status 200
    And match response == responsePut
    And assert response.id == requestPut.id
    And assert response.name == requestPut.name
    And assert response.status == requestPut.status
    And assert response.category.id == requestPut.category.id
    And assert response.category.name == requestPut.category.name
    And assert response.tags.id == requestPut.tags.id
    And assert response.tags.name == requestPut.tags.name


  Scenario Outline: Update a pet with invalid status values
    * def idPet = '<id>'
    * def responsePut = read('classpath:karate/request/responseErrorPost.json')

    Given path 'pet'
    And request
    """
    {
  "id": <id>,
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
  "status": "available"
}
    """
    When method put
    Then status 500
    And match response == responsePut

    Examples:
      | id                   |
      | /*-+*                |
      | testonetwo           |
      | 12345678901234567890 |
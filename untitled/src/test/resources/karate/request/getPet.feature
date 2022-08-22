Feature: Service pet get
  As QA Automation
  I want to consult a pet
  To validate the status code and response

  Background: consume service
    * url url


  Scenario: Filter a pet by id
    * def responseGet = read('classpath:karate/request/responseGet.json')
    * def requestGet = read ('classpath:karate/request/requestPost.json')
      Given path 'pet','4595'
      When  method get
      Then status 200
    And match response == responseGet
    And assert response.id == requestGet.id
    And assert response.name == requestGet.name
    And assert response.status == requestGet.status
    And assert response.category.id == requestGet.category.id
    And assert response.category.name == requestGet.category.name
    And assert response.tags.id == requestGet.tags.id
    And assert response.tags.name == requestGet.tags.name

  Scenario Outline: Get a pet with invalid id values
    * def idPet = '<id>'
    * def responseErrorGet = read ('classpath:karate/request/responseErrorGet.json')

    Given path 'pet', idPet
    When method get
    Then status 404
    And match response == responseErrorGet

    Examples:
      |id|
      |12345678900|
      |testOne    |
      |3.1416     |
      |*-+/       |




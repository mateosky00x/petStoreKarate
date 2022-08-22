Feature: Service client POST
  As QA automation
  I want to delete a pet by id
  To validate the status code and response

  Background: consume service
    * url url

  Scenario: Delete a pet by id
    * def responseDelete = read('classpath:karate/request/responseErrorPost.json')
    * def requestDelete = read ('classpath:karate/request/requestDelete.json')
    Given path 'pet','123'
    When  method delete
    Then status 200
    And match response == responseDelete

  Scenario Outline: Delete a pet with a invalid Id

    * def idPet = '<id>'

    Given path 'pet',idPet
    When method Delete
    Then status <code>
    And match response == <expected>

    Examples:
      | id        | code | expected                                                                                               |
      | 465956956 | 404  | ''                                                                                                     |
      | testing   | 404  | {code: '#number',type: '#string',message: '#string'}                                                   |
      |           | 405  | <?xml version="1.0" encoding="UTF-8" standalone="yes"?><apiResponse><type>unknown</type></apiResponse> |
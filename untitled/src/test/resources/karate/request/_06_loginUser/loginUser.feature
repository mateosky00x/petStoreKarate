Feature: Service client GET
  As QA automation
  I want to log in with a user
  To validate the status code and response

  Background: consume service
    * url url

  Scenario: check the log in with GET Method
    * def requestPost = read('karate/request/_06_loginUser/requestPostLogin.json')
    * def responsePost = read('karate/request/_06_loginUser/responsePostLogin.json')

    Given path 'user', 'login'
    When method get
    And request requestPost
    And match response == responsePost




Feature: Crud request wtih external files

  Background:
    Given url baseUrl

  Scenario: post request with json
    And path 'pet'
    And def myBody = read('classpath:data/myJson.json')
    And set myBody.name = 'newName'
    And set myBody.id = 2021
    And request myBody
    When method POST
    Then status 200
    And match response == myBody

  Scenario Outline: GET request with example table - <id>
    And path 'pet', id
    When method GET
    Then status 200
    Examples:
      | id  |
      | 250 |
      | 251 |
      | 252 |
      | 253 |

  Scenario Outline: Data table printing <id>
    * print 'current id is ->', id
    Examples:
      | id |
      | 10 |
      | 20 |
      | 30 |

  Scenario Outline: GET request with CSV table - <id>
    Given url 'https://petstore.swagger.io/v2'
    And path 'pet', id
    When method GET
    Then status 200
    Examples:
      | read('classpath:data/data.csv')|

  Scenario Outline: post request from table
    And path 'pet'
    And def myBody = read('classpath:data/myJson.json')
    And set myBody.id = id
    And set myBody.name = name
    And set myBody.status = status
    And request myBody
    When method POST
    Then status 200

    Examples:
      |read('classpath:data/myCsv.csv')|

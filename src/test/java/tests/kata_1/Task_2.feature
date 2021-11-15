Feature: crud request tasks

  Scenario: get request to pat endpoint
    Given url 'https://petstore.swagger.io/v2/pet/250'
    When method GET
    Then print response

  Scenario: Matchers
    Given url 'https://petstore.swagger.io/v2/pet/250'
    When method GET
    Then status 200
    And match response.id == 250
    And match response.name == '#string'
    And match response.status == '#present'

  Scenario: Path Params and matcher
    Given url 'https://petstore.swagger.io/v2'
    And def id = 250
    And path 'pet', id
    When method GET
    Then status 200
    And match response.id == id
    And match responseHeaders['Content-Type'][0] == 'application/json'
    #And header Content-Type = 'application/json' #you can also use

  Scenario: Json body response
    Given url 'https://petstore.swagger.io/v2/pet'
    * def MyJson =
    """
{
  "id": 3800,
  "category": {
    "id": 0,
    "name": "string"
  },
  "name": "doggie",
  "photoUrls": [
    "string"
  ],
  "tags": [
    {
      "id": 0,
      "name": "string"
    }
  ],
  "status": "available"
}
    """
    And request MyJson
    When method POST
    Then status 200
    * print response


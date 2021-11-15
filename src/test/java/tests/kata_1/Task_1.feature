Feature: My first kata test

  Scenario: Hello world
    * print 'hello world'
    * karate.log("My first log!")


  Scenario: variables printing
    * def myNum = 'Hello Word'
    * def MyVar = 15
    * print myNum , MyVar

  Scenario: using karate-config
    * print appId
    * print someUrlBase

  Scenario: printing JSON file
    * def myJson =
    """
    {
  "id": 0,
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
    * print myJson




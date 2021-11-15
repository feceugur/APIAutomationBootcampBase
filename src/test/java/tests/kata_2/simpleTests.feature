Feature: Kata-2


  Scenario: Read my json model from file
    * def myModel = read('classpath:data/myJson.json')
    * print myModel

  Scenario: reading data from json and set new value
    * def myVar = read('classpath:data/myJson.json')
    * myVar.name = 'my_name'
    * print myVar


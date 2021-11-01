### DESCRIPTION

The project **OpenWeather** is about developing automated test cases 
that check the funcionality of **openweathermap.org** website
using **Robot Framework**.

### Structure
- Tests
- Resources
    - PageObject
    - Steps
    - Global Variables - to test with your user you could update variables here
    - Tests Imports
    
- Results
    

### Requirements

- A working Python 3 development environment
- Downloaded webdrivers (at least "chrome" browser: it is set as a browser variable in Global_Variables.robot)

#### Installation
Highly recommended to use virtual python environment to run tests.

To install the required libraries, download GitHub project and execute the following command in the root project's directory:

`pip install –r requirements.txt`

### Running Tests
To run the tests execute the following command in the root project's directory:

`robot  -d results tests/[tests_file].robot`


for example:

`robot  -d results tests/api.robot`

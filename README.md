# QA Challenge

Paylocity QA Challenge.  


## Bugs

https://bit.ly/2sYRGWo

## Test Cases

Please see the `Central/Launch.robot` file.


## Automation

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

Pycharm or similiar IDE<br>
RobotFramework<br>
Selenium Library<br>
Chrome driver<br>


### Installing

How to get a development env running locally

Install Robot Framework

```
pip install robotframework
```

Install the Selenium Library for Robot Framework

```
pip install --upgrade robotframework-seleniumlibrary
```


Install the Chromedriver and add it to Path

```
brew install chromedriver
```


## Running the tests

Test will run with Chrome by default. This can be changed in the `${BROWSER}` variable in the  `Launch.robot` file

```
robot -d results  Central/Launch.robot
```
### Viewing Test Report and Log

The Robot Framework test results can be found in the results directory.  Results are displayed as a log, report, or as xml. The logs and reports provide a detailed view of the test suite. They also allow you to drill into the each test step which is helpful for test debugging. If there is a failed test Robot Framework includes a screen shot of the point of failure.




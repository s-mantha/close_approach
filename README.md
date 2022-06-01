To run the test locally, please run the script system_tests.sh

this would build the docker image and run all the tests

Robot allows to pass in variables and options through command line whre we can run tests:
1. With specific tags(including (-i)and excluding of tags(-e)) 
2. Particular suite of tests (-s )
3. specify name of test to run. (-t)
4. Pass in variables to the test suites.

All of this can be wrapped in bash script for easy use as a future improvement. 
For now to use such options. please,
1. cd into close_approach
2.  pip install -r requirments.txt
3. docker build -t api .
4. cd tests
5. robot . (this would run all the tests)

Examples of using options
1. robot -s "access_by_planet" .
2. robot -t "GET data from API - list of fields"
3. robot -v PLANET:mars.


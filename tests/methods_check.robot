*** Settings ***

Force Tags  Json  Other-Possiblities
Library  Collections
Library  RequestsLibrary
Library  ./keywords.py

Resource  test_settings.robot

Suite Teardown  Delete All Sessions
Suite Setup  Create a Session

*** Variables ***
${TARGET_HOST}          https://ssd-api.jpl.nasa.gov/cad.api
*** Keywords ***
Create a Session
    Create Session  Close Approach data for asteroids and comets  ${TARGET_HOST}

*** Test Cases ***

GET on the API
    [Documentation]   To perform "GET" on  close approach data for asteriods and comets
    ${resp}=  GET On Session  Close Approach data for asteroids and comets  ${TARGET_HOST}  
    Status Should Be  200

POST on the API
    [Documentation]   To perform "POST" on  close approach data for asteriods and comets
    ${resp}=  POST On Session  Close Approach data for asteroids and comets  ${TARGET_HOST}  data={}
    Status Should Be  200

PUT on the API
    [Documentation]   To perform "PUT" on  close approach data for asteriods and comets
    ${resp}=  PUT On Session  Close Approach data for asteroids and comets  ${TARGET_HOST}  expected_status=405
    Status Should Be  405

DELETE on the API
    [Documentation]   To perform "DELETE" on  close approach data for asteriods and comets
    ${resp}=  DELETE On Session  Close Approach data for asteroids and comets  ${TARGET_HOST}  expected_status=405
    Status Should Be  405

PATCH on the API
    [Documentation]   To perform "PATCH" on  close approach data for asteriods and comets
    ${resp}=  PATCH On Session  Close Approach data for asteroids and comets  ${TARGET_HOST}  expected_status=405
    Status Should Be  405

Bad Request on the API
    [Documentation]   To send a Bad Request to the API
    ${resp}=  GET On Session  Close Approach data for asteroids and comets  ${TARGET_HOST}  params=?des=433&dis=234  expected_status=400
    Status Should Be  400

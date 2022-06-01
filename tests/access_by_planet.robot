*** Settings ***

Force Tags  Json  Access-By-Planet
Library  Collections
Library  RequestsLibrary
Library  ./keywords.py

Resource  test_settings.robot

Suite Setup  Access API
Suite Teardown  Delete All Sessions

*** Variables ***
${PLANET}    earth
${MAX_DISTANCE}    10LD
${DATE}   2022-06-01

*** Keywords ***
Create a Session
    
Access API
    [Documentation]   This keyword creates a session and does a get request and the response returned can be used across this test suite.
    Create Session  Close Approach data for asteroids and comets  ${TARGET_HOST}  
    ${resp}=  GET On Session  Close Approach data for asteroids and comets   ${TARGET_HOST}  params=body=${PLANET}&dist-max=${MAX_DISTANCE}&date-min=${DATE}&sort=dist
    Set Suite Variable  ${suite_resp}  ${resp}
    [Return]  ${suite_resp}

*** Test Cases ***
GET data from API - signature source
    [Documentation]   To check if we get back expected value
    ${source}=  Get Metadata Content Nested Dict  signature  ${suite_resp.text}  source
    Should Be Equal As Strings  NASA/JPL SBDB Close Approach Data API  ${source}  "wrong value returned"

GET data from API - signature version
    [Documentation]   To check if we get back expected value
    ${version}=  Get Metadata Content Nested Dict  signature  ${suite_resp.text}  version  
    Should Be Equal As Strings  1.4  ${version}  "wrong value returned"

GET data from API - count
    [Documentation]   To check if we get back expected count
    ${count}=  Get Metadata Content  count  ${suite_resp.text}
    Should Be Equal As Integers  14  ${count}  "wrong value returned"

GET data from API - data 
    [Documentation]   To check if we get back expected sequence number
    ${data}=  Get Metadata Content Nested List  data  ${suite_resp.text}  0  1
    Should Be Equal As Strings  2022 KB3  ${data}  "wrong value returned"

GET data from API - list of fields
    [Documentation]   To check if we get back expected value
    ${fields}=  Get Metadata Content  fields  ${suite_resp.text}
    Should Be Equal As Strings  ['des', 'orbit_id', 'jd', 'cd', 'dist', 'dist_min', 'dist_max', 'v_rel', 'v_inf', 't_sigma_f', 'h']  ${fields}  "wrong value returned"

GET data from API - single value from list of fields
    [Documentation]   To check if we get back expected value
    ${field_value}=  Get List Value  fields  ${suite_resp.text}  0
    Should Be Equal As Strings  des  ${field_value}  "wrong value returned"


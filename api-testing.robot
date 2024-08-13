*** Settings ***
Documentation     Test Suite for robot framework test cases with customized keywords in python. Verify requests to
...               an open API, and check returned responses. This code was created with AI support
Resource    resources/keywords.resource
Suite Setup       Create Session Setup

*** Variables ***
${BASE_URL}       https://jsonplaceholder.typicode.com

*** Test Cases ***
Verify Status Code is 200
    [Documentation]    Check status code from the request ${BASE_URL}/posts/1 with GET
    ${response}=     GET         ${BASE_URL}   /posts/1
    Should Be Equal As Numbers   ${response.status_code}   200

Verify Status Code is 200 TYPE B
    [Documentation]    Check status code from the request ${BASE_URL}/posts/1 by creating a Session and Get On Session
    ${response}=     GET On Session   jsonplaceholder   /posts/1
    Should Be Equal As Numbers   ${response.status_code}   200

Verify JSON Response
    [Documentation]    Check id value in a request response ${BASE_URL}/posts/1
    ${response}=     GET On Session   jsonplaceholder   /posts/1
    ${id_value}=     Get From Dictionary   ${response.json()}   id
    Should Be Equal As Numbers   ${id_value}   1

Check Custom Logic
    ${response}=     GET On Session   jsonplaceholder   /posts/1
    ${userId}=       Get From Dictionary   ${response.json()}   userId
    ${result}=       Custom Check   ${userId}
    Should Be True   ${result}

Verify JSON Response with Custom Logic
    ${response}=     GET On Session   jsonplaceholder   /posts/1

    # Validate userId is within the range 1-10
    ${userId}=       Get From Dictionary   ${response.json()}   userId
    ${is_valid_id}=  Is User Id Valid   ${userId}   1   10
    Should Be True   ${is_valid_id}   msg=Invalid userId: ${userId}

    # Validate title length is within the range 5-100 characters
    ${title}=        Get From Dictionary   ${response.json()}   title
    ${is_valid_title}=  Is Title Length Valid   ${title}   5   100
    Should Be True   ${is_valid_title}   msg=Invalid title length: ${title}


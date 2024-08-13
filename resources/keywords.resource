*** Settings ***
Library           RequestsLibrary
Library           Collections
Library           OperatingSystem
Library           custom_libs.py

*** Keywords ***
Create Session Setup
    Create Session   jsonplaceholder   ${BASE_URL}    disable_warnings=1
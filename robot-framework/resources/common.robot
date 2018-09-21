*** Settings ***
Library           AppiumLibrary    run_on_failure=Capture Screenshot On Failure

*** Variables ***
${SCREENSHOTS}                  ${PROJECTROOT}${/}screenshots${/}

#${REMOTE_URL}                   http://localhost:4723/wd/hub
${REMOTE_URL}                   https://appium.bitbar.com/wd/hub

${AUTOMATION_NAME}              appium
${IOS_AUTOMATION_NAME}          XCUITest

#SERVERSIDE
${TESTDROIDAPIKEY}				Rn5xR2aoI7O02Hm6y93xMxwv5mCx35n2
${TESTDROIDUSERNAME}			janrapee.suwannatuch@allianz.com
${TESTDROIDPASSWORD}			Janrapee123
${TESTDROID_PROJECT}			Test Project
${TESTDROID_DEVICE}				Sony Xperia C5 Ultra -AL
${TESTDROID_TESTRUN}			Test run 1


${PLATFORM_NAME_ANDROID}        Android
${PLATFORM_VERSION_ANDROID}     6.0.1   # Uncomment this from the 'Open Application' keyword if you want to be specific
${DEVICE_NAME_ANDROID}          Galaxy Note8
${UDID}							988a1b30575535313230
#${APP_ANDROID}                  ${CURDIR}${/}app${/}builds${/}BitbarSampleApp.apk
#${APP_ANDROID}                  ${/}Users${/}pawinee${/}Downloads${/}testdroid-samples-master${/}apps${/}builds${/}BitbarSampleApp.apk
#${APP_ANDROID}                  ${PROJECTROOT}${/}application.apk    # Uncomment for cloud execution
${APP_ANDROID}					ddd3f9d7-dcc6-4c39-8dae-750a9ce48303/BitbarSampleApp.apk

${PLATFORM_NAME_IOS}            iOS
${PLATFORM_VERSION_IOS}         8.1.2   # Uncomment this from the 'Open Application' keyword if you want to be specific
${DEVICE_NAME_IOS}              Local Device
#${APP_IOS}                      ${CURDIR}${/}app${/}BitbarIOSSample.ipa
${APP_IOS}                      ${PROJECTROOT}${/}application.ipa    # Uncomment for cloud execution
${AUTO_ACCEPT_ALERTS}           true


*** Keywords ***

Set Up And Open Android Application
    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME_ANDROID}    testdroid_username=${TESTDROIDUSERNAME}    testdroid_password=${TESTDROIDPASSWORD} #testdroid_apiKey=${TESTDROIDAPIKEY}#platformVersion=${PLATFORM_VERSION_ANDROID}
#    ...    deviceName=${DEVICE_NAME_ANDROID}    app=${APP_ANDROID}    automationName=${AUTOMATION_NAME}    udid=${UDID}
    ...    testdroid_project=${TESTDROID_PROJECT}    testdroid_device=${TESTDROID_DEVICE}    testdroid_app=${APP_ANDROID}    testdroid_testrun=${TESTDROID_TESTRUN}    testdroid_target=Android
    Wait Until Page Contains    What is the best way to test your application    5s

Set Up And Open Ios Application
    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME_IOS}    #platformVersion=${PLATFORM_VERSION_IOS}
    ...    deviceName=${DEVICE_NAME_IOS}    app=${APP_IOS}    automationName=${IOS_AUTOMATION_NAME}     startIWDP=true
    Wait Until Page Contains    What is the best way to test your application    5s

Set Up And Open Chrome
    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME_ANDROID}    testdroid_username=${TESTDROIDUSERNAME}    testdroid_password=${TESTDROIDPASSWORD}
#    ...    deviceName=${DEVICE_NAME_ANDROID}    browserName=Chrome    automationName=${AUTOMATION_NAME}
	...    testdroid_project=${TESTDROID_PROJECT}    testdroid_device=${TESTDROID_DEVICE}    browserName=Chrome    testdroid_app=Chrome    testdroid_testrun=${TESTDROID_TESTRUN}    testdroid_target=Android
Set Up And Open Safari
    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME_IOS}    #platformVersion=${PLATFORM_VERSION_IOS}
    ...    deviceName=${DEVICE_NAME_IOS}    browserName=Safari    automationName=${IOS_AUTOMATION_NAME}     bundleid=com.apple.mobilesafari     startIWDP=true
    Wait Until Page Contains    Automation for Apps   10s

Capture Screenshot On Failure
    Capture Page Screenshot    ${SCREENSHOTS}${/}${TEST NAME}.png

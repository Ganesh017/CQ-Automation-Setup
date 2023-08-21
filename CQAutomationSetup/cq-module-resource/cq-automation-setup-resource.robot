*** Settings ***
Library           SeleniumLibrary

*** Keywords ***
login
    Input Text    //input[@id="username"]    admin01@emptycqpartner07.com.07empty54
    Input Password    //input[@id="password"]    ambarkaar1
    Click Element    //input[@id='Login']

create new user 1













    Wait Until Element Is Visible    //form[@id='editPage']//table[@class='detailList']//input[@id='name_firstName']    10s
    Capture Page Screenshot
    Input Text    //form[@id='editPage']//table[@class='detailList']//input[@id='name_firstName']    ${user.fname}
    Input Text    //table[@class='detailList']//input[@id='name_lastName']    ${user.lname}



    Input Text    //table[@class='detailList']//input[@id='Username']    ${user.username}
    Input Text    //table[@class='detailList']//input[@id='Email']    ${user.email}
    Capture Page Screenshot
    Click Element    //table[@class='detailList']//select[@id='user_license_id']
    Wait Until Element Is Visible    //table[@class='detailList']//select[@id='user_license_id']//option[contains(.//text(),'Chatter Only')]
    Click Element    //table[@class='detailList']//select[@id='user_license_id']//option[contains(.//text(),'Chatter Only')]
    #Click Element    //table[@class='detailList']//input[@id='UserPermissions_7']
    Click Element    //table[@class='detailList']//select[@id='TimeZoneSidKey']

    Click Element    //table[@class='detailList']//select[@id='TimeZoneSidKey']//option[contains(.//text(),'(GMT+05:45) Nepal Time (Asia/Kathmandu)')]
    Click Element    //div[@class='pbHeader']//input[@value='Save & New']
    Unselect Frame
    sleep    3s



    ${user1}=    Catenate    ${user.fname}    ${user.lname}
    Set global Variable    ${user1}
    log    ${user1}


queue - ak std
    Click Element    //select//option[contains(.//text(),'User: ak std')]
    Click Element    //a[@id='entity_select_0_right']//img[@class='rightArrowIcon'][@alt='Add']
    sleep     2s
    Capture Page Screenshot

Save queue
    Click Element    //td[@class='pbButton']//input[@value=' Save ']

navigate to permission sets
    Wait Until Element Is Visible    //input[@placeholder='Quick Find']    25s
    Input Text    //input[@placeholder='Quick Find']    permission
    Wait Until Element Is Visible    //ul[@role='group']//div[@title='Permission Sets']//a    10s
    Click Element    //ul[@role='group']//div[@title='Permission Sets']//a
    Wait Until Element Is Visible    //iframe[@title='Permission Sets ~ Salesforce - Enterprise Edition']    25s
    Select Frame    //iframe[@title='Permission Sets ~ Salesforce - Enterprise Edition']

Assign PS - CQ Admin PS
    Wait Until Element Is Visible    //div[@class='listViewport setupBlock']//span[contains(.//text(),'CQ Admin User')]    #CQ CAPA Admin
    Capture Page Screenshot
    Click Element    //div[@class='listViewport setupBlock']//span[contains(.//text(),'CQ Admin User')]
    Assignment

Assign PS - CQ Admin Extended Permission
    Wait Until Element Is Visible    //div[@class='listViewport setupBlock']//span[contains(.//text(),'CQ Admin Extended Permission')]    #CQ Audit Admin
    Capture Page Screenshot
    Click Element    //div[@class='listViewport setupBlock']//span[contains(.//text(),'CQ Admin Extended Permission')]
    Assignment

navigate to PSG
    Wait Until Element Is Visible    //input[@placeholder='Quick Find']    25s
    Input Text    //input[@placeholder='Quick Find']    permission
    Wait Until Element Is Visible    //ul[@role='group']//div[@title='Permission Set Groups']//a    10s
    Click Element    //ul[@role='group']//div[@title='Permission Set Groups']//a
    Wait Until Element Is Visible    //button[@title='Select a List View: Permission Set Groups']    10s
    Click Element    //button[@title='Select a List View: Permission Set Groups']
    Wait Until Element Is Visible    //a[@role='option']//span[contains(.//text(),'All Permission Set Groups')]
    Capture Page Screenshot
    Click Element    //a[@role='option']//span[contains(.//text(),'All Permission Set Groups')]

Assign PSG- CAPA Admin PSG
    Wait Until Element Is Visible    //a[@title='CQ CAPA Admin PSG']    15s
    Capture Page Screenshot
    Click Element    //a[@title='CQ CAPA Admin PSG']
    Assignment

Assignment
    Unselect Frame
    Wait Until Element Is Visible    //iframe[contains(@title,' ~ Salesforce - Enterprise Edition')]    25s
    Select Frame    //iframe[contains(@title,' ~ Salesforce - Enterprise Edition')]
    Wait Until Element Is Visible    //form[@id='page:console:pc_form']//input[@value='Manage Assignments']    10s
    sleep    2s
    Click Element    //form[@id='page:console:pc_form']//input[@value='Manage Assignments']    #manage assignment
    Wait Until Element Is Visible    //div[@class='setupcontent']//div[@class='slds-float_right']//button[@title='Add Assignment']    10s
    Click Element    //div[@class='setupcontent']//div[@class='slds-float_right']//button[@title='Add Assignment']
    Wait Until Element Is Visible    //button[@title='Select a List View: People']    10s
    Click Element    //button[@title='Select a List View: People']
    Wait Until Element Is Visible    //a[@role='option']//span[contains(.//text(),'All Users')]    10s
    Click Element    //a[@role='option']//span[contains(.//text(),'All Users')]    #all users
    Wait Until Element Is Visible    //a[contains(.//text(),'system admin')]//ancestor::tr//input    15s
    Capture Page Screenshot
    Execute Javascript    return document.evaluate('//tbody//tr//a[contains(.//text(),"${user1}")]//ancestor::tr//div[contains(@class,"slds-grid")]', document.body).iterateNext().click()    #particular user
    Execute Javascript    return document.evaluate('//tbody//tr//a[contains(.//text(),"${user2}")]//ancestor::tr//div[contains(@class,"slds-grid")]', document.body).iterateNext().click()
    Capture Page Screenshot
    Click Element    //button[contains(.//text(),'Next')]
    Wait Until Element Is Visible    //button[contains(.//text(),'Assign')]    15s
    Click Element    //button[contains(.//text(),'Assign')]
    Capture Page Screenshot

queue - PV STD
    Click Element    //select//option[contains(.//text(),'User: PV STD')]
    Click Element    //a[@id='entity_select_0_right']//img[@class='rightArrowIcon'][@alt='Add']
    sleep    2s
    Capture Page Screenshot

creation
    [Arguments]    ${fname}    ${lname}    ${username}    ${email}
    Wait Until Element Is Visible    //ul[@role='group']//div[@title='Users']//a    10s    #users
    Click Element    //ul[@role='group']//div[@title='Users']//a
    Wait Until Element Is Visible    //iframe[@title='All Users ~ Salesforce - Enterprise Edition']    25s
    Select Frame    //iframe[@title='All Users ~ Salesforce - Enterprise Edition']
    Wait Until Element Is Visible    //div[contains(@class,'bPageBlock')]//div[@class="pbHeader"]//td[@class="pbBottomButtons"]//input[@value="New User"]    20s
    Click Element    //div[contains(@class,'bPageBlock')]//div[@class="pbHeader"]//td[@class="pbBottomButtons"]//input[@value="New User"]
    #Execute Javascript    return document.evaluate('//div[contains(@class,'bPageBlock')]//div[@class="pbHeader"]//td[@class="pbBottomButtons"]//input[@value="New User"]', document.body).iterateNext().click();
    Unselect Frame
    Wait Until Element Is Visible    //iframe[@title='New User ~ Salesforce - Enterprise Edition']    20s
    Select Frame    //iframe[@title='New User ~ Salesforce - Enterprise Edition']
    Wait Until Element Is Visible    //form[@id='editPage']//table[@class='detailList']//input[@id='name_firstName']    10s
    FOR    ${Index}    IN RANGE    1    3
    Input Text    //form[@id='editPage']//table[@class='detailList']//input[@id='name_firstName']    ${fname}
    Input Text    //table[@class='detailList']//input[@id='name_lastName']    ${lname}
    Input Text    //table[@class='detailList']//input[@id='Username']    ${username}
    Input Text    //table[@class='detailList']//input[@id='Email']    ${email}
    Click Element    //table[@class='detailList']//select[@id='user_license_id']
    Wait Until Element Is Visible    //table[@class='detailList']//select[@id='user_license_id']//option[contains(.//text(),'Salesforce Platform')]
    Click Element    //table[@class='detailList']//select[@id='user_license_id']//option[contains(.//text(),'Salesforce Platform')]
    #Click Element    //table[@class='detailList']//input[@id='UserPermissions_7']
    Click Element    //table[@class='detailList']//select[@id='TimeZoneSidKey']
    Click Element    //table[@class='detailList']//select[@id='TimeZoneSidKey']//option[contains(.//text(),'(GMT+05:45) Nepal Time (Asia/Kathmandu)')]
    Click Element    //div[@class='pbHeader']//input[@value='Save & New']
    END
    Unselect Frame
    sleep    3s
    Unselect Frame
    Comment    Wait Until Element Is Visible    //iframe[contains(@title,'~ Salesforce - Enterprise Edition')]    20s
    Comment    Select Frame    //iframe[contains(@title,'~ Salesforce - Enterprise Edition')]
    Comment    Wait Until Element Is Visible    //div[@id='ep']//table[@class='detailList']//td[contains(.//text(), 'Name')]//following-sibling::td[contains(@class, 'dataCol col02')]    20s
    Comment    ${user_created}    Get Text    //div[@id='ep']//table[@class='detailList']//td[contains(.//text(), 'Name')]//following-sibling::td[contains(@class, 'dataCol col02')]
    Set Test Variable    ${user1}    ${fname} ${lname}
    log    ${user1}

Navigate to create user
    Wait Until Element Is Visible    //ul[@role='group']//div[@title='Users']//a    10s    #users
    Click Element    //ul[@role='group']//div[@title='Users']//a
    Wait Until Element Is Visible    //iframe[@title='All Users ~ Salesforce - Enterprise Edition']    25s
    Select Frame    //iframe[@title='All Users ~ Salesforce - Enterprise Edition']
    Wait Until Element Is Visible    //div[contains(@class,'bPageBlock')]//div[@class="pbHeader"]//td[@class="pbBottomButtons"]//input[@value="New User"]    20s
    Click Element    //div[contains(@class,'bPageBlock')]//div[@class="pbHeader"]//td[@class="pbBottomButtons"]//input[@value="New User"]
    #Execute Javascript    return document.evaluate('//div[contains(@class,'bPageBlock')]//div[@class="pbHeader"]//td[@class="pbBottomButtons"]//input[@value="New User"]', document.body).iterateNext().click();
    Unselect Frame
    Wait Until Element Is Visible    //iframe[@title='New User ~ Salesforce - Enterprise Edition']    20s
    Select Frame    //iframe[@title='New User ~ Salesforce - Enterprise Edition']

create new user 2
    Wait Until Element Is Visible    //iframe[@title='New User ~ Salesforce - Enterprise Edition']    20s
    Select Frame    //iframe[@title='New User ~ Salesforce - Enterprise Edition']
    Wait Until Element Is Visible    //form[@id='editPage']//table[@class='detailList']//input[@id='name_firstName']    20s
    Input Text    //form[@id='editPage']//table[@class='detailList']//input[@id='name_firstName']    ${user.fname2}
    Input Text    //table[@class='detailList']//input[@id='name_lastName']    ${user.lname2}



    Input Text    //table[@class='detailList']//input[@id='Username']    ${user.username2}
    Input Text    //table[@class='detailList']//input[@id='Email']    ${user.email}
    Click Element    //table[@class='detailList']//select[@id='user_license_id']
    Wait Until Element Is Visible    //table[@class='detailList']//select[@id='user_license_id']//option[contains(.//text(),'Chatter Only')]
    Click Element    //table[@class='detailList']//select[@id='user_license_id']//option[contains(.//text(),'Chatter Only')]
    #Click Element    //table[@class='detailList']//input[@id='UserPermissions_7']
    Click Element    //table[@class='detailList']//select[@id='TimeZoneSidKey']
    Click Element    //table[@class='detailList']//select[@id='TimeZoneSidKey']//option[contains(.//text(),'(GMT+05:45) Nepal Time (Asia/Kathmandu)')]
    Click Element    //div[@class='pbHeader']//input[@value='Save & New']
    Capture Page Screenshot
    Unselect Frame
    sleep    3s
    ${user2}=    Catenate    ${user.fname}    ${user.lname}
    Set Suite Variable    ${user2}




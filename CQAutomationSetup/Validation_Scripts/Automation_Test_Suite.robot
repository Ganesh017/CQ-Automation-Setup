*** Settings ***
Library           SeleniumLibrary
Resource          ../Common_Resources/Common_Resources.txt
Resource          ../cq-module-resource/cq-automation-setup-resource.robot

*** Test Cases ***
01 - Creating New User
    Open Browser    ${url}    Chrome
    Maximize Browser Window
    login
    Wait Until Element Is Visible    //input[@placeholder='Quick Find']    25s
    Input Text    //input[@placeholder='Quick Find']    Users
    Navigate to create user
    create new user 1
    Comment    create new user 2
    Comment    ${user1}=    create new user 1
    Comment    Set Test Variable    ${user1}

02 - CQ Change Queue
    Open Browser    ${url}    Chrome
    Maximize Browser Window
    login
    Wait Until Element Is Visible    //input[@placeholder='Quick Find']    25s
    Input Text    //input[@placeholder='Quick Find']    queue
    Wait Until Element Is Visible    //ul[@role='group']//div[@title='Queues']//a    10s
    Click Element    //ul[@role='group']//div[@title='Queues']//a
    Wait Until Element Is Visible    //iframe[@title='Queues ~ Salesforce - Enterprise Edition']    25s
    Select Frame    //iframe[@title='Queues ~ Salesforce - Enterprise Edition']
    Click Element    //table[@class='list']//a[@title='Edit - Record 1 - CQ Change Queue']
    Unselect Frame
    Wait Until Element Is Visible    //iframe[contains(@title,' ~ Salesforce - Enterprise Edition')]    15s
    Select Frame    //iframe[contains(@title,' ~ Salesforce - Enterprise Edition')]
    Capture Page Screenshot
    ${count}=    Get Element Count    //select//option[contains(.//text(),'ak std')]
    ${count pv}    Get Element Count    //select//option[contains(.//text(),'PV STD')]
    Run Keyword If    ${count} == 0    queue - ak std
    ...    ELSE IF    ${count pv} == 0    queue - PV STD
    ...    ELSE    Run Keyword    Save queue

03 - Permission Sets-Ganesh User1
    Open Browser    ${url}    Chrome
    Maximize Browser Window
    login
    #navigate to permission sets
    #Assign PS - CAPA Admin PS
    navigate to permission sets
    Assign PS - CQ Admin Extended Permission
    navigate to PSG
    Assign PSG- CAPA Admin PSG

04 - Approval Matrices
    Open Browser    ${url}    Chrome
    Maximize Browser Window
    login
    Wait Until Element Is Visible    //header[@id="oneHeader"]//div[contains(@class,"slds-global-header__item")]//span[@role="tooltip" and contains(.//text(),"Setup")]//parent::div    20s
    Click Element    //div[@class='slds-icon-waffle']
    Wait Until Element Is Visible    //button[contains(.//text(),'View All')]
    Click Element    //button[contains(.//text(),'View All')]
    Wait Until Element Is Visible    //input[@placeholder='Search apps or items...']    10s
    Input Text    //input[@placeholder='Search apps or items...']    Approval Matrices
    Wait Until Element Is Visible    //lightning-accordion-section//mark[contains(.//text(),'Approval Matrices')]
    Click Element    //lightning-accordion-section//mark[contains(.//text(),'Approval Matrices')]
    Wait Until Element Is Visible    //ul[contains(@class,'branding-actions')]//div[@title='New']    15s
    Click Element    //ul[contains(@class,'branding-actions')]//div[@title='New']
    Wait Until Element Is Visible    //fieldset//span[contains(.//text(),'CAPA')][@class='slds-form-element__label']    15s
    Click Element    //fieldset//span[contains(.//text(),'CAPA')][@class='slds-form-element__label']
    Click Element    //div[@class='inlineFooter']//span[contains(.//text(),'Next')][@class=' label bBody']
    Wait Until Element Is Visible    //records-record-layout-section//input[@class='slds-input'][@type='text']    15s
    Input Text    //records-record-layout-section//input[@class='slds-input'][@type='text']    New Capa Approval
    Wait Until Element Is Visible    //records-form-footer//lightning-button//button[@name='SaveEdit']
    Click Element    //records-form-footer//lightning-button//button[@name='SaveEdit']
    Wait Until Element Is Visible    //lst-list-view-manager-header//button[@name='New']    10s    #Assign User
    Capture Page Screenshot
    Click Element    //lst-list-view-manager-header//button[@name='New']
    Wait Until Element Is Visible    //fieldset//span[contains(.//text(),'CAPA')][@class='slds-form-element__label']    10s
    Click Element    //fieldset//span[contains(.//text(),'CAPA')][@class='slds-form-element__label']
    Click Element    //div[@class='inlineFooter']//span[contains(.//text(),'Next')][@class=' label bBody']
    Wait Until Element Is Visible    //div[@class='slds-form']//input[@name='compliancequest__Step__c']    10s
    Input Text    //div[@class='slds-form']//input[@name='compliancequest__Step__c']    1    #step
    Click Element    //div[@class='slds-form']//input[@placeholder='Search People...']
    Input Text    //div[@class='slds-form']//input[@placeholder='Search People...']    Beta User
    sleep    2s
    Click Element    //div[@class='slds-form']//input[@placeholder='Search People...']//parent::div//following-sibling::div[contains(@class,'slds-listbox')]//ul
    Click Element    //div[@class='center-align-buttons']//button[@name='SaveEdit']    #save
    sleep     2s
    Capture Page Screenshot

05 - Public Groups
    Open Browser    ${url}    Chrome
    Maximize Browser Window
    login
    Wait Until Element Is Visible    //input[@placeholder='Quick Find']    25s
    Input Text    //input[@placeholder='Quick Find']    public Groups
    Wait Until Element Is Visible    //ul[@role='group']//div[@title='Public Groups']//a    10s
    Click Element    //ul[@role='group']//div[@title='Public Groups']//a
    Wait Until Element Is Visible    //iframe[@title='Public Groups ~ Salesforce - Enterprise Edition']    15s
    Select Frame    //iframe[@title='Public Groups ~ Salesforce - Enterprise Edition']
    Click Element    //div[@class='listHeader']//input[@value=' New ']    #new
    Unselect Frame
    Wait Until Element Is Visible    //iframe[@title='Group Membership: New Group ~ Salesforce - Enterprise Edition']    10s
    Select Frame    //iframe[@title='Group Membership: New Group ~ Salesforce - Enterprise Edition']
    Wait Until Element Is Enabled    //div[@class='pbBody']//tbody//td[contains(@class,'ataCol')]//input[@name='p2']
    Input Text    //div[@class='pbBody']//tbody//td[contains(@class,'ataCol')]//input[@name='p2']    ${group.pg}    #label
    Click Element    //div[@class='duelingListBox']//select[@name='sharing_search']
    Click Element    //div[@class='duelingListBox']//select[@name='sharing_search']//option[@value='U']
    Click Element    //select//option[contains(.//text(),'User: Gamma User')]
    Click Element    //a[@id='duel_select_0_right']//img[@class='rightArrowIcon'][@alt='Add']
    Capture Page Screenshot
    Save queue
    Unselect Frame
    # sharing settings for personnel
    Wait Until Element Is Visible    //iframe[@title='Public Groups ~ Salesforce - Enterprise Edition']    10s
    Click Element    //input[@placeholder='Quick Find']
    Input Text    //input[@placeholder='Quick Find']    Sharing Settings
    Wait Until Element Is Visible    //ul[@role='group']//div[@title='Sharing Settings']//a    10s
    Click Element    //ul[@role='group']//div[@title='Sharing Settings']//a
    Wait Until Element Is Visible    //iframe[contains(@title,' ~ Salesforce - Enterprise Edition')]    15s
    Select Frame    //iframe[contains(@title,' ~ Salesforce - Enterprise Edition')]
    Click Element    //div[@class='sharingTypeSelection']//select[@id='st']
    Wait Until Element Is Visible    (//div[@class='sharingTypeSelection']//select[@id='st']//option[contains(.,'Personnel')])[1]
    Click Element    (//div[@class='sharingTypeSelection']//select[@id='st']//option[contains(.,'Personnel')])[1]
    Wait Until Element Is Visible    //tbody//input[@Value=' New ']    10s
    Click Element    //tbody//input[@Value=' New ']
    Wait Until Element Is Visible    //iframe[contains(@title,' ~ Salesforce - Enterprise Edition')]
    Select Frame    //iframe[contains(@title,' ~ Salesforce - Enterprise Edition')]
    Input Text    //table[@class='detailList']//tbody//td[contains(@class,'data2Col')]//input[@name='ruleName']    ${group.pg}
    Wait Until Element Is Visible    //table[@class='detailList']//div[@id='srcGrpDiv']//select[@id='ownedby_R']
    Click Element    //table[@class='detailList']//div[@id='srcGrpDiv']//select[@id='ownedby_R']
    Click Element    //table[@class='detailList']//div[@id='srcGrpDiv']//select[@id='ownedby_R']//option[contains(.,'All Internal Users')]    #select option
    Click Element    //select[@id='sharedwith_R']
    Click Element    //select[@id='sharedwith_R']//option[contains(.,'${group.pg}')]
    Click Element    //select[@id='p3']
    Click Element    //select[@id='p3']//option[contains(.,'Read/Write')]
    Capture Page Screenshot
    Click Element    //td[@class='pbButtonb']//input[@value=' Save ']
    sleep    3s
    Handle Alert

06 - Accounts
    Open Browser    ${url}    Chrome
    Maximize Browser Window
    login
    Wait Until Element Is Visible    //header[@id="oneHeader"]//div[contains(@class,"slds-global-header__item")]//span[@role="tooltip" and contains(.//text(),"Setup")]//parent::div    20s
    Click Element    //div[@class='slds-icon-waffle']
    Wait Until Element Is Visible    //button[contains(.//text(),'View All')]
    Click Element    //button[contains(.//text(),'View All')]
    Wait Until Element Is Visible    //input[@placeholder='Search apps or items...']    15s
    Input Text    //input[@placeholder='Search apps or items...']    Accounts
    Wait Until Element Is Visible    //lightning-accordion-section//mark[contains(.//text(),'Accounts')]
    Click Element    //lightning-accordion-section//mark[contains(.//text(),'Accounts')]
    Wait Until Element Is Visible    //ul[contains(@class,'branding-actions')]//div[@title='New']    15s
    Click Element    //ul[contains(@class,'branding-actions')]//div[@title='New']
    Wait Until Element Is Visible    //fieldset//span[contains(.//text(),'Default')][@class='slds-form-element__label']    15s
    Click Element    //fieldset//span[contains(.//text(),'Default')][@class='slds-form-element__label']
    Click Element    //div[@class='inlineFooter']//button[contains(@class,'slds-button')]//span[contains(.,'Next')]
    Wait Until Element Is Visible    //records-record-layout-section//input[@class='slds-input'][@type='text'][@name='Name']
    Input Text    //records-record-layout-section//input[@class='slds-input'][@type='text'][@name='Name']    ${Account.a1}
    Wait Until Element Is Visible    //records-form-footer//lightning-button//button[@name='SaveEdit']
    Click Element    //records-form-footer//lightning-button//button[@name='SaveEdit']
    Wait Until Element Is Visible    //article//button[@name='NewContact']    10s
    Click Element    //article//button[@name='NewContact']
    Wait Until Element Is Visible    //lightning-input//input[@name='lastName']
    Input Text    //lightning-input//input[@name='firstName']    ${Contacts.c1f}
    Input Text    //lightning-input//input[@name='lastName']    ${Contacts.c1l}
    Click Element    //records-form-footer[contains(@class,'slds-docked-form-footer')]//lightning-button//button[@name='SaveEdit']

07 - Custom Settings
    Open Browser    ${url}    Chrome
    Maximize Browser Window
    login
    Wait Until Element Is Visible    //input[@placeholder='Quick Find']    25s
    Input Text    //input[@placeholder='Quick Find']    Custom settings
    Wait Until Element Is Visible    //ul[@role='group']//div[@title='Custom Settings']//a    10s
    Click Element    //ul[@role='group']//div[@title='Custom Settings']//a
    Wait Until Element Is Visible    //iframe[contains(@title,' ~ Salesforce - Enterprise Edition')]    15s
    Select Frame    //iframe[contains(@title,' ~ Salesforce - Enterprise Edition')]
    Wait Until Element Is Visible    //table[@class='list']//tr//a[contains(@title,'Manage - Record 2 - CQ Settings')]    10s
    Click Element    //table[@class='list']//tr//a[contains(@title,'Manage - Record 2 - CQ Settings')]
    Unselect Frame
    Wait Until Element Is Visible    //iframe[contains(@title,' ~ Salesforce - Enterprise Edition')]    15s
    Select Frame    //iframe[contains(@title,' ~ Salesforce - Enterprise Edition')]
    Wait Until Element Is Visible    //div[@class='pbHeader']//input[@id='CS_list:CS_Form:theDetailPageBlock:thePageBlockButtons:edit']
    Click Element    //div[@class='pbHeader']//input[@id='CS_list:CS_Form:theDetailPageBlock:thePageBlockButtons:edit']
    Unselect Frame
    sleep    5s
    Wait Until Element Is Visible    //iframe[contains(@title,' ~ Salesforce - Enterprise Edition')]    15s
    Select Frame    //iframe[contains(@title,' ~ Salesforce - Enterprise Edition')]
    Wait Until Element Is Visible    //div[@class='pbSubsection']//table[@class='detailList']//input[@id='CS_Edit:CS_Form:thePageBlock:thePageBlockSection:compliancequest__Auto_Number_Audit_Program__c']    15s
    Click Element    //div[@class='pbSubsection']//table[@class='detailList']//input[@id='CS_Edit:CS_Form:thePageBlock:thePageBlockSection:compliancequest__Auto_Number_Audit_Program__c']
    Input Text    //table[@class='detailList']//input[@id='CS_Edit:CS_Form:thePageBlock:thePageBlockSection:compliancequest__Date_Format__c']    dd-MMM-yyyy    #date
    Input Text    //table[@class='detailList']//input[@id='CS_Edit:CS_Form:thePageBlock:thePageBlockSection:compliancequest__Controlled_Document_Secondary_Format__c']    Auto
    Input Text    //div[@class='pbSubsection']//table[@class='detailList']//input[@id='CS_Edit:CS_Form:thePageBlock:thePageBlockSection:compliancequest__CQ_VisualForce_Base_URL__c']    ${Custom.v_url}    # CQ VisualForce Base URL
    Input Text    //div[@class='pbSubsection']//table[@class='detailList']//input[@id='CS_Edit:CS_Form:thePageBlock:thePageBlockSection:compliancequest__Community_URL__c']    ${Custom.b_url}    # Community URL
    Input Text    //div[@class='pbSubsection']//table[@class='detailList']//input[@id='CS_Edit:CS_Form:thePageBlock:thePageBlockSection:compliancequest__Org_Base_URL__c']    ${Custom.b_url}    # Org Base URL
    Select Checkbox    //div[@class='pbSubsection']//table[@class='detailList']//input[@id='CS_Edit:CS_Form:thePageBlock:thePageBlockSection:compliancequest__All_Audit_Response_Require_Approval__c']    #All Responses for Finding Need Approval?
    Select Checkbox    //div[@class='pbSubsection']//table[@class='detailList']//input[@id='CS_Edit:CS_Form:thePageBlock:thePageBlockSection:compliancequest__Active_personnel_during_approval_signoff__c']    #Active personnel during approval signoff
    Select Checkbox    //div[@class='pbSubsection']//table[@class='detailList']//input[@id='CS_Edit:CS_Form:thePageBlock:thePageBlockSection:compliancequest__Auto_Number_Audit_Program__c']    # Auto Number Audit Program
    Select Checkbox    //div[@class='pbSubsection']//table[@class='detailList']//input[@id='CS_Edit:CS_Form:thePageBlock:thePageBlockSection:compliancequest__Auto_Number_Controlled_Document__c']    # Auto Number Controlled Document
    Capture Page Screenshot
    Select Checkbox    //div[@class='pbSubsection']//table[@class='detailList']//input[@id='CS_Edit:CS_Form:thePageBlock:thePageBlockSection:compliancequest__Create_Complaint_Evaluation_Records__c']    # Create Complaint Evaluation Records
    Select Checkbox    //div[@class='pbSubsection']//table[@class='detailList']//input[@id='CS_Edit:CS_Form:thePageBlock:thePageBlockSection:compliancequest__Enable_Document_Distribution__c']    # Enable Document Distribution
    Select Checkbox    //div[@class='pbSubsection']//table[@class='detailList']//input[@id='CS_Edit:CS_Form:thePageBlock:thePageBlockSection:compliancequest__Inspection_Outbound_Transactions__c']    # Inspection Outbound Transactions
    Select Checkbox    //div[@class='pbSubsection']//table[@class='detailList']//input[@id='CS_Edit:CS_Form:thePageBlock:thePageBlockSection:compliancequest__Platform_Object_Trigger_Control__c']    # Platform Object Trigger Control
    Select Checkbox    //div[@class='pbSubsection']//table[@class='detailList']//input[@id='CS_Edit:CS_Form:thePageBlock:thePageBlockSection:compliancequest__Use_Approval_Matrix_For_Document__c']    # Use Approval Matrix For Document,
    Select Checkbox    //div[@class='pbSubsection']//table[@class='detailList']//input[@id='CS_Edit:CS_Form:thePageBlock:thePageBlockSection:compliancequest__Use_Batch_For_Document_Status_Change__c']    # Use Batch For Document Status Change
    Select Checkbox    //div[@class='pbSubsection']//table[@class='detailList']//input[@id='CS_Edit:CS_Form:thePageBlock:thePageBlockSection:compliancequest__Use_Batch_For_Session_Roster_Processing__c']    # Use Batch For Session Roster Processing
    Select Checkbox    //div[@class='pbSubsection']//table[@class='detailList']//input[@id='CS_Edit:CS_Form:thePageBlock:thePageBlockSection:compliancequest__Use_Batch_Job_To_Process_REQ_Training__c']    # Use Batch Job To Process REQ Training
    Select Checkbox    //div[@class='pbSubsection']//table[@class='detailList']//input[@id='CS_Edit:CS_Form:thePageBlock:thePageBlockSection:compliancequest__Use_Browser_PDF_Viewer__c']    # Use Browser PDF Viewer
    Unselect Checkbox    //div[@class='pbSubsection']//table[@class='detailList']//input[@id='CS_Edit:CS_Form:thePageBlock:thePageBlockSection:compliancequest__Require_Comment_for_Approval_Rejection__c']    # Require Comment for Approval Rejection
    Unselect Checkbox    //table[@class='detailList']//input[contains(@id,'CS_Edit:CS_Form:thePageBlock:thePageBlockSection:compliancequest__Default_for_Additional_Response__c')]    # Default for Additional Response
    Unselect Checkbox    //table[@class='detailList']//input[contains(@id,'CS_Edit:CS_Form:thePageBlock:thePageBlockSection:compliancequest__Full_PDF_Rendition_On__c')]    # Full PDF Rendition On
    Unselect Checkbox    //table[@class='detailList']//input[contains(@id,'CS_Edit:CS_Form:thePageBlock:thePageBlockSection:compliancequest__Process_Linked_Complaint_Asynchronously__c')]    # Process Linked Complaint Asynchronously
    Unselect Checkbox    //table[@class='detailList']//input[contains(@id,'CS_Edit:CS_Form:thePageBlock:thePageBlockSection:compliancequest__NC_Integration__c')]    # Process Internal Finding as NC
    Unselect Checkbox    //table[@class='detailList']//input[contains(@id,'CS_Edit:CS_Form:thePageBlock:thePageBlockSection:compliancequest__Transition_NC_To_Triage__c')]    # Beta - Transition NC to Triage
    Unselect Checkbox    CS_Edit:CS_Form:thePageBlock:thePageBlockSection:compliancequest__Enable_Root_Cause_in_NC__c    # Enable Root Cause in NC
    Scroll Element Into View    CS_Edit:CS_Form:thePageBlock:thePageBlockSection:compliancequest__Enable_Root_Cause_in_NC__c
    Capture Page Screenshot
    Click Element    //div[@class='pbHeader']//input[contains(@id,'CS_Edit:CS_Form:thePageBlock:thePageBlockButtons:save')]    # Save

08 - Setup
    Set Global Variable    ${url}    https://test.salesforce.com/
    Open Browser    ${url}    Chrome
    Maximize Browser Window
    login
    Set Selenium Speed    0.2
    Wait Until Element Is Visible    //header[@id="oneHeader"]//div[contains(@class,"slds-global-header__item")]//span[@role="tooltip" and contains(.//text(),"Setup")]//parent::div    20s
    Wait Until Element Is Visible    //div[contains(@class,'profileTrigger')]//span[@class='uiImage']
    Click Element    //div[contains(@class,'profileTrigger')]//span[@class='uiImage']
    Wait Until Element Is Visible    //div[@class='oneUserProfileCard']//h1//a[@class='profile-link-label']    10s
    Click Element    //div[@class='oneUserProfileCard']//h1//a[@class='profile-link-label']
    #Execute Javascript    document.querySelector('//header[@id="oneHeader"]//div[contains(@class,"slds-global-header__item")]//div[@role="button" and @aria-expanded="true"]//div[@role="menu"]//li[@id="related_setup_app_home"]').click();
    Wait Until Element Is Visible    //div[@class='slds-align-middle']//div[@title='User Detail']    15s    #User Details
    Click Element    //div[@class='slds-align-middle']//div[@title='User Detail']
    Wait Until Element Is Visible    //input[@placeholder='Quick Find']    25s
    Input Text    //input[@placeholder='Quick Find']    Users
    #Execute Javascript    document.querySelector('//header[@id="oneHeader"]//div[contains(@class,"slds-global-header__item")]//div[@role="button" and @aria-expanded="true"]//div[@role="menu"]//li[@id="related_setup_app_home"]').click();
    sleep    5s

09 - Hierarchical Codes
    Open Browser    ${url}    Chrome
    Maximize Browser Window
    login
    Wait Until Element Is Visible    //header[@id="oneHeader"]//div[contains(@class,"slds-global-header__item")]//span[@role="tooltip" and contains(.//text(),"Setup")]//parent::div    20s
    Click Element    //div[@class='slds-icon-waffle']
    Wait Until Element Is Visible    //button[contains(.//text(),'View All')]
    Click Element    //button[contains(.//text(),'View All')]
    Wait Until Element Is Visible    //input[@placeholder='Search apps or items...']    10s
    Input Text    //input[@placeholder='Search apps or items...']    Hierarchical codes
    Wait Until Element Is Visible    //lightning-accordion-section//mark[contains(.//text(),'Hierarchical Codes')]
    Click Element    //lightning-accordion-section//mark[contains(.//text(),'Hierarchical Codes')]
    Wait Until Element Is Visible    //ul[contains(@class,'branding-actions')]//div[@title='New']    15s
    Click Element    //ul[contains(@class,'branding-actions')]//div[@title='New']
    Wait Until Element Is Visible    //fieldset//span[contains(.//text(),'Non-Complaint Related')][@class='slds-form-element__label']    15s
    Click Element    //fieldset//span[contains(.//text(),'Non-Complaint Related')][@class='slds-form-element__label']
    Click Element    //div[@class='inlineFooter']//span[contains(.//text(),'Next')][@class=' label bBody']
    Wait Until Element Is Visible    //records-record-layout-section//input[@class='slds-input'][@name='Name']    15s
    Input Text    //records-record-layout-section//input[@class='slds-input'][@name='Name']    Hierarchical Code
    Click Element    //label[contains(.,'Type')]//parent::lightning-combobox//button
    #//label[contains(.,'Type')]//parent::lightning-combobox//button//span[contains(.,'Process Failure Code')]
    Click Element    //records-form-footer//lightning-button//button[@name='SaveEdit']

practise
    Open Browser    ${url}    Chrome
    Maximize Browser Window
    login
    Wait Until Element Is Visible    //input[@placeholder='Quick Find']    25s
    Input Text    //input[@placeholder='Quick Find']    Users
    Wait Until Element Is Visible    //ul[@role='group']//div[@title='Users']//a    10s
    Click Element    //ul[@role='group']//div[@title='Users']//a
    Wait Until Element Is Visible    //iframe[@title='All Users ~ Salesforce - Enterprise Edition']    25s
    Select Frame    //iframe[@title='All Users ~ Salesforce - Enterprise Edition']
    Click Element    (//table[@class='list']//th[@scope='row'])[24]
    sleep    3s
    Unselect Frame
    Wait Until Element Is Visible    //iframe[contains(@title,'~ Salesforce - Enterprise Edition')]    20s
    Select Frame    //iframe[contains(@title,'~ Salesforce - Enterprise Edition')]
    Wait Until Element Is Visible    //div[@id='ep']//table[@class='detailList']//td[contains(.//text(), 'Name')]//following-sibling::td[contains(@class, 'dataCol col02')]    20s
    ${user_created}    Get Text    //div[@id='ep']//table[@class='detailList']//td[contains(.//text(), 'Name')]//following-sibling::td[contains(@class, 'dataCol col02')]
    Set Test Variable    ${user1}    ${user_created}
    log    ${user1}

new testcase
    Open Browser    ${url}    Chrome
    Maximize Browser Window
    login
    Wait Until Element Is Visible    //input[@placeholder='Quick Find']    25s

    Click Element    //input[@placeholder='Quick Find']
    Input Text    //input[@placeholder='Quick Find']    Sharing Settings
    Wait Until Element Is Visible    //ul[@role='group']//div[@title='Sharing Settings']//a    10s
    Click Element    //ul[@role='group']//div[@title='Sharing Settings']//a
    Wait Until Element Is Visible    //iframe[contains(@title,' ~ Salesforce - Enterprise Edition')]    15s
    Select Frame    //iframe[contains(@title,' ~ Salesforce - Enterprise Edition')]
    Click Element    //div[@class='sharingTypeSelection']//select[@id='st']
    Wait Until Element Is Visible    (//div[@class='sharingTypeSelection']//select[@id='st']//option[contains(.,'Personnel')])[1]
    Click Element    (//div[@class='sharingTypeSelection']//select[@id='st']//option[contains(.,'Personnel')])[1]
    Wait Until Element Is Visible    //tbody//input[@Value=' New ']    10s
    Click Element    //tbody//input[@Value=' New ']
    Wait Until Element Is Visible    //iframe[contains(@title,' ~ Salesforce - Enterprise Edition')]
    Select Frame    //iframe[contains(@title,' ~ Salesforce - Enterprise Edition')]
    Input Text    //table[@class='detailList']//tbody//td[contains(@class,'data2Col')]//input[@name='ruleName']    ${group.pg}
    Wait Until Element Is Visible    //table[@class='detailList']//div[@id='srcGrpDiv']//select[@id='ownedby_R']
    Click Element    //table[@class='detailList']//div[@id='srcGrpDiv']//select[@id='ownedby_R']
    Click Element    //table[@class='detailList']//div[@id='srcGrpDiv']//select[@id='ownedby_R']//option[contains(.,'All Internal Users')]    #select option
    Click Element    //select[@id='sharedwith_R']
    Click Element    //select[@id='sharedwith_R']//option[contains(.,'${group.pg}')]
    Click Element    //select[@id='p3']
    Click Element    //select[@id='p3']//option[contains(.,'Read/Write')]
    Click Element    //td[@class='pbButtonb']//input[@value=' Save ']
    sleep    3s
    Handle Alert

parctice1

    Open Browser    ${url}    Chrome
        Maximize Browser Window
        login
        Wait Until Element Is Visible    //input[@placeholder='Quick Find']    25s
        Input Text    //input[@placeholder='Quick Find']    Users
    #    creation    @{User List}
        @{User List}    creation    ram    shyam    hari@exam.com    here@gmail,com
        creation    ${UserList.fname}    ${UserList.lname}    ${UserList.username}    ${UserList.email}

*** Keywords ***

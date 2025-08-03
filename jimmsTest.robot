*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${userName}=    MickeyMouse
${password}=    Hiiri1234

*** Test Cases ***
Test 1
    Open Browser    https://www.jimms.fi/
    ...    Chrome    options=add_experimental_option("detach", True)
    Maximize Browser Window

    Click element    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[1]/a
    sleep    2s
    Click Element    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[1]/div/ul/li[1]/a/span
    sleep    2s



      ${count}=    Get Element Count   xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[*]/a
    FOR    ${index}    IN RANGE    2    ${count}
        Log    ${index}
        Double Click element    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[${index}]/a

    END
    Close Browser
Test 2
    Open Browser    http://jimms.fi    
    ...    Chrome    options=add_experimental_option("detach", True)
    
    Maximize Browser Window
    
    Click Element    name:q
    Input Text    name:q    ps5

    Press Keys    ${None}    ENTER
    Sleep    2
    Set Screenshot Directory    C:/HAMK opinnot/Ohjelmistotestaus/RobotFiles/
    Capture Element Screenshot    xpath:/html/body/main/div[2]/div/div[2]/div[5]/div/div[1]/product-box/div[2]/div[1]/a/div    ps5.png
    
    Click Element    xpath:/html/body/main/div[2]/div/div[2]/div[5]/div/div[1]/product-box/div[2]/div[1]/a/div

    Page Should Contain    PS5  

    Close Browser

Test 3,4,5
    Open Browser    http://jimms.fi    
    ...    Chrome    options=add_experimental_option("detach", True)
    
    Maximize Browser Window
    
    Click Element    name:q
    Input Text    name:q    ps5

    Press Keys    ${None}    ENTER
    Sleep    2
    
    Click Element    xpath:/html/body/main/div[2]/div/div[2]/div[5]/div/div[1]/product-box/div[2]/div[1]/a/div

    Page Should Contain Link    xpath:/html/body/main/div[1]/div[2]/div/jim-product-cta-box/div/div[2]/div[2]/addto-cart-wrapper/div/a

    Page Should Contain Element    xpath:/html/body/main/div[1]/div[2]/div/jim-product-cta-box/div/div[2]/div[2]/addto-cart-wrapper/div/a/span
    Set Screenshot Directory    C:/HAMK opinnot/Ohjelmistotestaus/RobotFiles/

    Capture Element Screenshot    xpath:/html/body/main/div[1]/div[2]/div/jim-product-cta-box/div/div[2]/div[2]/addto-cart-wrapper/div/a/span    MeiElementScreenshot.png
    Click Element    xpath:/html/body/main/div[1]/div[2]/div/jim-product-cta-box/div/div[2]/div[2]/addto-cart-wrapper/div/a 

    Sleep    2

    Close Browser

Test 6

    Open Browser    https://www.jimms.fi/
    ...    Chrome    options=add_experimental_option("detach", True)
    Sleep    1
    Maximize Browser Window
    Sleep    1

    Page Should Contain    Kirjaudu / Luo tili
    Click Element    xpath:/html/body/header/div/div[3]/jim-customer-dropdown-nav/div/div/a
    Sleep    1
    Page Should Contain    Kirjaudu / Uusi asiakas
    Click Element    name:UserName
    Input Text    name:UserName    ${userName}

    Click Element    name:Password
    Input Text    name:Password    ${password}

    Click Element    id:loginbtn

    Page Should Contain    Virheellinen käyttäjätunnus tai salasana.
    Sleep    5

    Close Browser
Test 7
     Open Browser    http://jimms.fi    
    ...    Chrome    options=add_experimental_option("detach", True)
    
    Maximize Browser Window
    
    Click Element    name:q
    Input Text    name:q    ps5

    Press Keys    ${None}    ENTER
    Sleep    2

    Input Text    xpath:/html/body/main/div[2]/div/div[1]/filtermenu/div[1]/div[2]/div[2]/div[3]/div[2]/div/div[1]/div/div[1]/input  100
    Press Keys    ${None}    ENTER
    
    Sleep    2
    Input Text    xpath:/html/body/main/div[2]/div/div[1]/filtermenu/div/div[2]/div[2]/div[3]/div[2]/div/div[1]/div/div[3]/input    200
    Press Keys    ${None}    ENTER
    
    Sleep    2
    
                               
    ${Price}=    Get Text   xpath:/html/body/main/div[2]/div/div[2]/div[5]/div/div[1]/product-box/div[2]/div[3]/div
    Log    ${Price}
    Should Be True    100<${Price}[:3]<200

    Close Browser
Test 8

    Open Browser    https://www.jimms.fi/    Chrome    options=add_experimental_option("detach", True)
    Maximize Browser Window
    Click element    xpath:/html/body/div[1]/div/a[4]
    Click element    xpath:/html/body/main/div[2]/div/div[1]/div/div[2]/ul/li[6]/a
    Click Element    xpath:/html/body/main/div[2]/div/div[2]/div/div/ol/li[2]/ul/li[1]/a

    Click Element    RmaTypeID
    Select From List By Label    RmaTypeID    Tietokoneen/konepaketin takuu

    Click Element    SalesID
    Input Text    SalesID    123456789

    Click Element    Name
    Input Text    Name    Donald Duck

    Click Element    StreetAddress
    Input Text    StreetAddress    Palmutie 13

    Click Element    PostalCode
    Input Text    PostalCode    987654321

    Click Element    City
    Input Text    City    Duckberg

    Run Keyword And Continue On Failure    Click Element    Email
    Run Keyword And Continue On Failure    Input Text    Email    Donald@gmail.com

    Run Keyword And Continue On Failure    Click Element    Phone
    Run Keyword And Continue On Failure    Input Text    Phone    45687123

    Run Keyword And Continue On Failure       Click Element    RmaProductCode
    Run Keyword And Continue On Failure       Input Text    RmaProductCode    123987456

    Run Keyword And Continue On Failure        Click Element    RmaProductName
    Run Keyword And Continue On Failure       Input Text    RmaProductName    PS5

    Run Keyword And Continue On Failure        Click Element    RmaMessage
    Run Keyword And Continue On Failure        Input Text    RmaMessage    Product was bad

    Run Keyword And Continue On Failure        Click Element    BankAccount
    Run Keyword And Continue On Failure       Input Text    BankAccount    51 4886 1548 1584

    Run Keyword And Continue On Failure        Click Element    OSPassword
    Run Keyword And Continue On Failure        Input Text    OSPassword    Very secret

    Sleep    5s
    Run Keyword And Continue On Failure    Double Click Element    xpath:/html/body/main/div[2]/div/div[2]/div/div/form/input[2]

    Close Browser

Test 9
    Open Browser    https://www.jimms.fi/   Chrome
    Maximize Browser Window
    Sleep    2


    Click Element    xpath:/html/body/header/div/div[3]/jim-customer-dropdown-nav/div/div/a

    Page Should Contain Element    xpath:/html/body/main/div/div[2]/div[1]/div/div/div/form/a

    Click Element    xpath:/html/body/main/div/div[2]/div[1]/div/div/div/form/a
    Input Text    EmailAddress    Donald.duck@d.com

    Input Text    UserName    Meikämandoliini
    Click Button    ForgetPasswordSubmit
    Page Should Contain    Antamaasi käyttäjätunnusta ei löydy tai antamasi sähköpostiosoite ei täsmää käyttäjän sähköpostiosoitteen kanssa.
    
    Close Browser
Test 10
    Open Browser    https://www.jimms.fi/
    ...    Chrome    options=add_experimental_option("detach", True)
    Sleep    1
    Maximize Browser Window
    Sleep    1

    Page Should Contain Element    xpath:/html/body/div[1]/div/a[4]
    Click Element    xpath:/html/body/div[1]/div/a[4]

    Page Should Contain Link    xpath:/html/body/main/div[2]/div/div[2]/div/div/div[2]/div[1]/div/div/p[3]/a

    Page Should Contain Link    xpath:/html/body/main/div[2]/div/div[2]/div/div/div[2]/div[1]/div/div/div/p[2]/a

    Page Should Contain Link    xpath:/html/body/main/div[2]/div/div[2]/div/div/div[3]/div[1]/div/div/div/div[2]/p[2]/a

    Page Should Contain Link    xpath:/html/body/main/div[2]/div/div[2]/div/div/div[4]/div[1]/div/div/div/div[1]/p[2]/a

    Page Should Contain Link    xpath:/html/body/main/div[2]/div/div[2]/div/div/div[6]/div/p[3]/a

    Sleep    2

    Close Browser
    
    # Bitti-itsarit:
    #     Jukka Viitanen
    #     Joni Väyrynen
    #     Niko Pänttönen
    #     Valtteri Laine
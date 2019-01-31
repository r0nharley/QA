*** Settings ***

Library  SeleniumLibrary


*** Variables ***


${QAChallenge}              file:///Users/ronharley/Downloads/Paylocity%20QA%20Interview%20Challenge/login.html
${UserNameField}            //input[@name='form-username']
${PasswordField}            //input[@name='form-password']
${LoginButton}              //button[@type='submit'][contains(.,'Login')]
${InvalidAttempt}           //div[contains(@id,'validation-errors')]
${BenefitsDashboardHeader}  //h1[contains(.,'Benefits Dashboard')]
${AddEmployeeButton}        //button[@type='button'][contains(.,'Add Employee')]
${DeleteEmployeeButton}     //span[contains(@title,'Delete')]
${EditEmployee}             //span[contains(@class,'glyphicon glyphicon-wrench')]
${AddEmployeeHeader}        //h4[@class='modal-title'][contains(.,'Add Employee & His dependents')]
${AddFirstName}             (//input[contains(@type,'text')])[1]
${AddLastName}              (//input[contains(@type,'text')])[2]
${DependantsField}          (//input[contains(@type,'text')])[3]
${SubmitButton}             //button[@type='button'][contains(.,'Submit')]
${CloseButton}              //button[@type='button'][contains(.,'Close')]
${CloseButtonX}             //button[@type='button'][contains(.,'×')]
${FirstNameEdit}            //td[contains(.,'Edit First')]
${LastNameEdit}             //td[contains(.,'Edit Last')]
${EmployeeBeneCostPerPay}   (//td[contains(.,'38.46')])[1]
${1DependantBeneCost}       (//td[contains(.,'57.69')])[1]
${3DependantsBeneCost}       (//td[contains(.,'96.15')])[1]
${1Dependant}               (//td[contains(.,'1')])[2]
${3Dependants}              (//td[contains(.,'3')])[2]
${AddDependantVerify}       (//td[contains(.,'4')])[2]
${GrossPay}                 2000
${PayChecks}                26
${EmployeeBeneCost}         1000
${DailyEmployeeBeneCost}    38.46
${DependantBeneCost}        500
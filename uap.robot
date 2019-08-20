*** Settings ***
Library  String
Library  DateTime
Library  uap_service.py

*** Variables ***
${locator.auctionID}                                           id=tenderidua
${locator.title}                                               xpath=(//input[@ng-model='data.title'])[1]
${locator.description}                                         xpath=(//textarea[@ng-model='data.description'])[1]
${locator.item.description}                                    id=description
${locator_item_quantity}                                       xpath=//div[contains(@name,'item_id')]//*[contains(@id, 'itemsQuantity')]
${locator.minimalStep.amount}                                  xpath=//div[@class = 'row']/div/p[text() = 'Мінімальний крок аукціону:']/parent::div/following-sibling::div/p
${locator.procuringEntity.name}                                jquery=customer-info>div.row:contains("Найменування:")>:eq(1)>
${locator.value.amount}                                        id=lotvalue_0
${locator.proposition.value.amount}                            xpath=//div/input[@ng-model='bid.value.amount']
${locator.button.updateBid}                                    xpath=//button[@click-and-block='updateBid(bid)']
${locator.button.selectDocTypeForDoc}                          xpath=//select[@name='docType' and @id='docType' and @ng-model='selectedDocType' and @ng-change='docTypeSelectHundler()']
${locator.button.selectDocTypeForIll}                          xpath=(//tender-documents//*[@id='docType' and @ng-change='docTypeSelectHundler()'])
${locator.button.selectDocTypeForLicence}                      id=selectDoctype2
${locator.button.selectDocTypeForProtocol}                     id=selectDoctype1
${locator.button.addProtocol}                                  id=addNewDocToExistingBid2_0
${locator.button.addDoc}                                       id=tend_doc_add
${locator.dgfID}                                               xpath=//div[@class = 'row']/div/p[text() = 'Номер лоту:']/parent::div/following-sibling::div/p   # на сторінці перегляду
${locator.tenderPeriod.endDate}                                xpath=//div[@class = 'row']/div/p[text() = 'Завершення прийому пропозицій:']/parent::div/following-sibling::div/p
${locator.auctionPeriod.startDate}                             xpath=//span[@ng-if='lot.auctionPeriod.startDate']
${locator.minNumberOfQualifiedBids}                            xpath=//div[@class = 'row']/div/p[text() = 'Мінімальна кількість учасників:']/parent::div/following-sibling::div/p
${locator_item_unit.code}                                      id=item_unit_symb0
${locator_question_item}                                       xpath=//select[@ng-model='vm.question.item']
${locator.contracts[-1].status}                                xpath=//div[@ng-if='isShowContract(award)']//p[text()='Статус договору:']/parent::div/following-sibling::div/p
${locator.value.currency}                                      xpath=//span[@id='lotvalue_0']/parent::p
${locator.value.valueAddedTaxIncluded}                         xpath=//span[@id='lotvalue_0']/following-sibling::i
${locator.guarantee.amount}                                    xpath=//div[@class = 'row']/div/p[contains(.,'Розмiр гарантiйного внеску:')]/parent::div/following-sibling::div/p  # на сторінці перегляду
${locator.items[0].unit.name}                                  id=item_unit_symb0
${locator.items[1].unit.name}                                  id=item_unit_symb1
${locator.items[2].unit.name}                                  id=item_unit_symb2
${locator.bids}                                                id=ParticipiantInfo_0
${locator.bids_0_amount}                                       xpath=(//form[@name='changeBidForm']//div[@class = 'row']/div/p[text() = 'Cума:']/parent::div/following-sibling::div/div/div/span)[1]  #note: mixed en/ru chars!
${locator.eligibilityCriteria}                                 xpath=//div[@class = 'row']/div/p[text() = 'Критерії прийнятності:']/parent::div/following-sibling::div/p
${locator.lot_items_unit}                                      id=itemsUnit0                    #Одиниця виміру
${locator_document_title}                                      xpath=//a[contains(text(),'XX_doc_id_XX')]
${locator_document_description}                                xpath=//a[contains(text(),'XX_doc_id_XX')]/following-sibling::span
${locator_tender_document_documentType}                        xpath=(//tender-documents/div[@ng-show='documents.length>0']//a)[XX_doc_index_XX +1]/../../../li[@class='list-group-item']
${locator_question_title}                                      xpath=//span[contains(@id,'quest_title_') and contains(text(),'XX_que_id_XX')]
${locator_question_description}                                xpath=//span[contains(@id,'quest_title_') and contains(text(),'XX_que_id_XX')]/ancestor::div[contains(@ng-repeat,'question in questions')]//span[contains(@id,'quest_descr_')]
${locator_question_answer}                                     xpath=//span[contains(@id,'quest_title_') and contains(text(),'XX_que_id_XX')]/ancestor::div[contains(@ng-repeat,'question in questions')]//pre[contains(@id,'question_answer_')]
${locator_dgfID}                                               id=dgfID  # на сторінці створення
${locator_start_auction_creation}                              xpath=//a[contains(@class, 'btn btn-info') and contains(@href, 'createTender')]  # на сторінці МОЇ ТОРГИ
${locator_block_overlay}                                       xpath=//div[@class='blockUI blockOverlay']
${locator_auction_search_field}                                xpath=//input[@ng-model='searchString' and contains(@placeholder,'Пошук')]
${actives_counter_of_lot}                                      xpath=//div[@class = 'row']/div/p[text() = 'Загальна кількість активів лоту:']/parent::div/following-sibling::div/p
${locator_tender_attempts}                                     id=tenderAttempts
${locator.dgfDecisionDate}                                     id=dgfDecisionDateOut
${locator.dgfDecisionID}                                       id=dgfDecisionIdOut
${locator_dgfDecisionIDCreate}                                 id=dgfDecisionID
${dgfPublicAssetCertificateTitle}                              id=dgfPublicAssetCertificateTitle
${xdgfPublicAssetCertificateLinkId}                            id=xdgfPublicAssetCertificateLinkId
${locator.procurementMethodType}                               xpath=//span[@ng-show='getTenderProcedureType()']
${locator.dgfDecisionDate}                                     id=dgfDecisionDateId
${locator.dgfDecisionID}                                       id=dgfDecisionID_Id
${locator.tenderAttempts}                                      id=tenderAtempts
${locator_auction_value_amount}                                id=Value
${locator_auction_minimalStep_amount}                          id=minimalStep
${locator_auction_guarantee_amount}                            id=Guarantee
${locator_auction_registrationFee_amount}                      id=RegistrationFee
${locator_auction_bankAccount_bankName}                        id=accountDetailsBankName
${locator_auction_bankAccount_description}                     id=accountDetailsDescription

*** Keywords ***
Wait Scroll Click
  [Arguments]  ${locator}  ${timeout}=5
  Wait and Click  ${locator}  ${timeout}  True

Wait and Click
  [Arguments]  ${locator}  ${timeout}=5  ${scroll}=False
  [Documentation]  Wait for visibility and then click
  Дочекатись зникнення blockUI
  Wait Until Element Is Visible  ${locator}  ${timeout}
  Run Keyword If  '${scroll}'=='True'  scrollIntoView by script  ${locator}
  Click Element  ${locator}

Wait and Select By Label
  [Arguments]  ${locator}  ${data}  ${timeout}=5
  [Documentation]  Wait for visibility and then select by label
  Wait Until Element Is Visible     ${locator}  ${timeout}
  Select From List By Label         ${locator}  ${data}

Wait and Input
  [Arguments]  ${locator}  ${data}  ${timeout}=5
  [Documentation]  Wait for visibility and then input text
  Wait Until Element Is Visible  ${locator}  ${timeout}
  Input text  ${locator}  ${data}

Wait and Get Text
  [Arguments]  ${locator}  ${timeout}=5
  [Documentation]  Wait for visibility and then input text
  Wait Until Element Is Visible  ${locator}  ${timeout}
  Run Keyword And Return  Get Text  ${locator}

Wait and Get Attribute
  [Arguments]  ${locator}  ${attribute}  ${timeout}=5
  [Documentation]  Wait for visibility and then input text
  Wait Until Element Is Visible  ${locator}  ${timeout}
  Run Keyword And Return  Get Element Attribute  ${locator}@${attribute}

JavaScript scrollBy
  [Arguments]  ${x_offset}  ${y_offset}
  Execute JavaScript  window.scrollBy(${x_offset}, ${y_offset})

scrollIntoView by script
  [Arguments]  ${locator}
  [Documentation]  use xpath or id
  ${locator}=       prepare_locator_to_scroll   ${locator}  # convert id to xpath and cut xpath=
  Execute JavaScript  document.evaluate('${locator}', document.documentElement, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).scrollIntoView();
  JavaScript scrollBy  0  -100

Дочекатись зникнення blockUI
  [Arguments]
  Wait Until Keyword Succeeds  15x  0s  Wait Until Page Does Not Contain Element  xpath=//div[@class='blockUI blockOverlay']  2

Input String
  [Arguments]  ${locator}  ${value}
  [Documentation]  Converts value to string and inputs to locator field
  ${value}=     Convert To String       ${value}
  Input text    ${locator}              ${value}

Підготувати клієнт для користувача
  [Arguments]  @{ARGUMENTS}
  [Documentation]  Відкрити браузер, створити об’єкт api wrapper, тощо
  Open Browser  ${USERS.users['${ARGUMENTS[0]}'].homepage}  ${USERS.users['${ARGUMENTS[0]}'].browser}  alias=${ARGUMENTS[0]}
  Set Window Size  @{USERS.users['${ARGUMENTS[0]}'].size}
  Set Window Position  @{USERS.users['${ARGUMENTS[0]}'].position}
  Set Global Variable   ${tenderpage}   ${EMPTY}
  Run Keyword If  '${ARGUMENTS[0]}' != 'uap_Viewer'  Login  ${ARGUMENTS[0]}

Login
  [Arguments]  ${username}
  Click Element  xpath=(//a[contains(@class,'btn-login')])[2]
  Wait and Input   id=inputUsername     ${USERS.users['${username}'].login}     15
  Wait and Input   id=inputPassword     ${USERS.users['${username}'].password}  15
  Wait and Click   id=btn_submit
  Дочекатись зникнення blockUI
  Run Keyword And Ignore Error  Wait and Click  xpath=//button[@class='cancel'][contains(text(), 'Відміна')]  60  #Закрити повідомлення про наявність питань
  ${status}  ${value}=  Run Keyword And Ignore Error  Перевірка перебування у режимі навчання
  Run Keyword If        '${status}' == 'FAIL'         Fatal Error

Підготувати дані для оголошення тендера
  [Arguments]  ${username}  ${tender_data}  ${role_name}
  ${tender_data}=  Run Keyword IF  '${username}' != 'uap_Viewer'   adapt_data   ${tender_data}
  ...             ELSE  Set Variable  ${tender_data}
  Log  ${tender_data}
  [return]  ${tender_data}

Редагувати asset
  [Arguments]  ${usernamme}  ${tender_uaid}
  uap.Пошук об’єкта МП по ідентифікатору  ${usernamme}  ${tender_uaid}
  Wait and Click    id=EditAsset

Зберегти зміни
  Дочекатись зникнення blockUI
  Wait and Click    id=CreateTenderE

Перевірка перебування у режимі навчання
  Page Should Contain Element        xpath=//span[@bs-tooltip='tooltip'][contains(text(), 'режимі навчання')]       Організація у режим реальних торгів!

Field Value Is Not Empty
  [Arguments]  ${locator}
  Reload Page
  Дочекатись зникнення blockUI
  ${text}=   Get Text    ${locator}
  Run Keyword  Should Not Be Empty  ${text}
  [Return]  ${text}

Пошук по ідентифікатору
  [Arguments]  ${tender_uaid}  ${tab}  ${href}
  Wait and Click    id=assetBtn
  Wait and Click    ${tab}
  Wait and Input    xpath=//input[@ng-model="searchString"]  ${tender_uaid}
  Sleep  1
  Wait and Click    xpath=//a[@ng-click="search()"]
  Дочекатись зникнення blockUI
  Wait and Click    xpath=//a[contains(@href,'${href}')]
  Дочекатись зникнення blockUI

Пошук об’єкта МП по ідентифікатору
  [Arguments]  ${username}  ${tender_uaid}
  Пошук по ідентифікатору  ${tender_uaid}  id=assetTab  assetDetails

Пошук лоту по ідентифікатору
  [Arguments]  ${username}  ${tender_uaid}
  Пошук по ідентифікатору  ${tender_uaid}  id=lotTab    lotDetails
  Зберегти посилання

Пошук тендера по ідентифікатору
  [Arguments]  ${username}  ${tender_uaid}
  Пошук по ідентифікатору  ${tender_uaid}  id=auctionTab  auctionDetails
  Зберегти посилання

Зберегти посилання
  Return From Keyword If  '${tenderpage}'!='${EMPTY}'
  ${page}=    Get Location
  Log   ${page}     WARN
  Set Global Variable     ${tenderpage}  ${page}

Оновити сторінку з тендером
  [Arguments]  ${username}  ${tender_uaid}
  Switch Browser    ${username}
  Run Keyword If  "Відображення відповіді на запитання" in "${TEST_NAME}"  uap.Пошук тендера по ідентифікатору  ${username}  ${tender_uaid}
  Run Keyword If  "Відображення відповіді на запитання" in "${TEST_NAME}"  Sleep  60
  Reload Page
  Дочекатись зникнення blockUI

#-------------------ASSET-------------------#
Створити об'єкт МП
  [Arguments]  ${username}  ${asset}
  ${currentUrl}  Get Location
  ${not_profile_page}  Run Keyword And Return Status  Should Not Contain  ${currentUrl}  profile
  Run Keyword If  ${not_profile_page}  Wait and Click  xpath=//a[@href="#/profile"]
  Wait and Click  xpath=//a[@href="/#/createAsset"]
  Log       ${asset}
  ${asset}=     Set Variable        ${asset.data}

  Wait and Input    xpath=(//input[@ng-model='data.title'])[1]      ${asset.title}
  Click Element     xpath=(//a[@ng-click='showTitle = 2'])[1]
  Input Text        xpath=(//input[@ng-model='data.titleEN'])[1]    ${asset.title_en}
  Click Element     xpath=(//a[@ng-click='showTitle = 3'])[1]
  Input Text        xpath=(//input[@ng-model='data.titleRU'])[1]    ${asset.title_ru}
  Input Text        xpath=(//textarea[@ng-model='data.description'])[1]     ${asset.description}
  Click Element     xpath=(//a[@ng-click='showDescription = 2'])[1]
  Input Text        xpath=(//textarea[@ng-model='data.descriptionEN'])[1]   ${asset.description_en}
  Click Element     xpath=(//a[@ng-click='showDescription = 3'])[1]
  Input Text        xpath=(//textarea[@ng-model='data.descriptionRU'])[1]   ${asset.description_ru}

  Input Text        xpath=(//input[@ng-model='data.title'])[2]       ${asset.decisions[0].title}
  Click Element     xpath=(//a[@ng-click='showTitle = 2'])[2]
  Input Text        xpath=(//input[@ng-model='data.titleEN'])[2]     ${asset.decisions[0].title_en}
  Click Element     xpath=(//a[@ng-click='showTitle = 3'])[2]
  Input Text        xpath=(//input[@ng-model='data.titleRU'])[2]     ${asset.decisions[0].title_ru}
  ${decisionDate}=  convert_dgfDecisionDate_to_etender_format   ${asset.decisions[0].decisionDate}
  Input Text        id=decisionDate0     ${decisionDate}
  Input Text        id=decisionID0       ${asset.decisions[0].decisionID}
  Створити об'єкти активу   ${asset['items']}

  Click Element     xpath=//label[contains(., 'Дані балансоутримувача')]
  Wait and Input    id=identifierApiId      ${asset.assetHolder.identifier.id}
  Input Text        id=assetHolderName      ${asset.assetHolder.name}
  Input Text        id=identifierLegalName  ${asset.assetHolder.identifier.legalName}

  Wait and Click    xpath=//label[input[@ng-model="showData.address"]]
  ${region}=    Set Variable If  '${asset.assetHolder.address.region}'=='місто Київ'  Київ  ${asset.assetHolder.address.region}
  Select From List By Label     id=region   ${region}
  Run Keyword Unless  '${region}'=='Київ'  Input Text    id=newCity     ${asset.assetHolder.address.locality}
  Input Text        id=addressStr           ${asset.assetHolder.address.streetAddress}
  Input Text        id=postIndex            ${asset.assetHolder.address.postalCode}

  Wait and Click    xpath=//label[input[@ng-model="showData.contactPoint"]]
  Input Text        xpath=//input[@ng-model='data.lastName']     qwe
  Input Text        xpath=//input[@ng-model='data.firstName']    qwe
  Input Text        xpath=//input[@ng-model='data.patronymic']   qwe
  Input Text        id=email        ${asset.assetHolder.contactPoint.email}
  Input Text        xpath=(//input[contains(@id,'phone')])[1]        ${asset.assetHolder.contactPoint.telephone}00000
  Input Text        id=url          ${asset.assetHolder.contactPoint.url}
  Input Text        id=fax          ${asset.assetHolder.contactPoint.faxNumber}
  Зберегти зміни
  Sleep  15
  ${asset_id}=  Wait Until Keyword Succeeds  10 min  30 sec  Field Value Is Not Empty  id=assetidua
  Wait and Click    id=publishBtn
  Дочекатись зникнення blockUI
  Reload Page
  Дочекатись зникнення blockUI
  [Return]  ${asset_id}

Оновити сторінку з об'єктом МП
  [Arguments]  ${username}  ${tender_uaid}
  Reload Page
  Дочекатись зникнення blockUI

Отримати інформацію із об'єкта МП
  [Arguments]  ${username}  ${tender_uaid}  ${field}
  ${currentUrl}  Get Location
  ${not_details_page}  Run Keyword And Return Status  Should Not Contain  ${currentUrl}  assetDetails
  Run Keyword If  ${not_details_page}  uap.Пошук об’єкта МП по ідентифікатору    ${username}  ${tender_uaid}
  Run Keyword And Return    Отримати інформацію із об'єкта про ${field}

Отримати інформацію із об'єкта про assetID
  Run Keyword And Return    Wait and Get Text  id=assetidua

Отримати інформацію із об'єкта про date
  ${value}=     Get Text    id=assetCreationTime
  Run Keyword And Return    convert_etender_date_to_iso_format  ${value}

Отримати інформацію із об'єкта про dateModified
  ${value}=     Get Text    id=assetDate
  Run Keyword And Return    convert_etender_date_to_iso_format  ${value}

Отримати інформацію із об'єкта про rectificationPeriod.endDate
  ${value}=     Get Text    id=rectificationPeriodEnd
  Run Keyword And Return    convert_etender_date_to_iso_format  ${value}

Отримати інформацію із об'єкта про status
  ${value}=     Get Text    id=assetStatus
  Run Keyword And Return    convert_etender_string_to_common_string     ${value}

Отримати інформацію із об'єкта про title
  Run Keyword And Return    Get Text    id=titleOut

Отримати інформацію із об'єкта про description
  Run Keyword And Return    Get Text    id=descriptionOut

Отримати інформацію із об'єкта про decisions[0].title
  Run Keyword And Return    Get Text    id=decisionTitle

Отримати інформацію із об'єкта про decisions[0].decisionDate
  ${value}=     Get Text    id=decisionDate
  Run Keyword And Return    convert_etender_date_to_ymd     ${value}

Отримати інформацію із об'єкта про decisions[0].decisionID
  Run Keyword And Return    Get Text    id=decisionID

Отримати інформацію із об'єкта про assetHolder.name
  Run Keyword And Return    Get Text    id=assetHolderName

Отримати інформацію із об'єкта про assetHolder.identifier.scheme
  ${value}=     Get Text    id=assetHolderScheme
  Run Keyword And Return    convert_etender_string_to_common_string  ${value}

Отримати інформацію із об'єкта про assetHolder.identifier.id
  Run Keyword And Return    Get Text    id=assetHolderCode

Отримати інформацію із об'єкта про assetCustodian.identifier.scheme
  ${value}=     Get Text    id=assetCustodianScheme
  Run Keyword And Return    convert_etender_string_to_common_string  ${value}

Отримати інформацію із об'єкта про assetCustodian.identifier.id
  Run Keyword And Return    Get Text    id=assetCustodianCode

Отримати інформацію із об'єкта про assetCustodian.identifier.legalName
  Run Keyword And Return    Get Text    id=assetCustodianName

Отримати інформацію із об'єкта про assetCustodian.contactPoint.name
  Run Keyword And Return    Get Text    id=assetCustodianCPName

Отримати інформацію із об'єкта про assetCustodian.contactPoint.telephone
  Run Keyword And Return    Get Text    id=assetCustodianCPPhone

Отримати інформацію із об'єкта про assetCustodian.contactPoint.email
  Run Keyword And Return    Get Text    id=assetCustodianCPEmail

Отримати інформацію із об'єкта про documents[0].documentType
  ${value}=  Wait Until Keyword Succeeds  5x  30s  Оновити сторінку і отримати дані з поля  xpath=//asset-documents//li/div
  Run Keyword And Return    convert_etender_string_to_common_string     ${value.split(': ')[1]}

Оновити сторінку і отримати дані з поля
  [Arguments]  ${locator}
  Reload Page
  Дочекатись зникнення blockUI
  Run Keyword And Return    Get Text    ${locator}

Отримати інформацію з активу об'єкта МП
  [Arguments]  ${username}  ${tender_uaid}  ${item}  ${fieldname}
  Run Keyword And Return  Отримати інформацію із предмета активу про ${fieldname}  ${item}

Отримати інформацію із предмета активу про description
  [Arguments]  ${item}
  Run Keyword And Return    Get Text    xpath=//div[contains(@name, '${item}')]//*[@name='description']

Отримати інформацію із предмета активу про classification.scheme
  [Arguments]  ${item}
  Run Keyword And Return    Get Text    xpath=//div[contains(@name, '${item}')]//*[@name='classification.scheme']

Отримати інформацію із предмета активу про classification.id
  [Arguments]  ${item}
  Run Keyword And Return    Get Text    xpath=//div[contains(@name, '${item}')]//*[@name='classification.id']

Отримати інформацію із предмета активу про unit.name
  [Arguments]  ${item}
  ${value}=     Get Text    xpath=//div[contains(@name, '${item}')]//*[@name='unit.name']
  Run Keyword And Return    convert_etender_string_to_common_string     ${value}

Отримати інформацію із предмета активу про registrationDetails.status
  [Arguments]  ${item}
  ${value}=     Get Text    xpath=//div[contains(@name, '${item}')]//*[@name='registrationStatus']
  Run Keyword And Return    convert_etender_string_to_common_string     ${value}

Отримати інформацію із предмета активу про quantity
  [Arguments]  ${item}
  ${value}=     Get Text    xpath=//div[contains(@name, '${item}')]//*[@name='quantity']
  Run Keyword And Return    Convert To Number   ${value}

Внести зміни в об'єкт МП
  [Arguments]  ${usernamme}  ${tender_uaid}  ${fieldname}  ${fieldvalue}
  Редагувати asset  ${usernamme}  ${tender_uaid}
  Input Text        ${locator.${fieldname}}     ${fieldvalue}
  Зберегти зміни

Внести зміни в актив об'єкта МП
  [Arguments]  ${usernamme}  ${item_id}  ${tender_uaid}  ${fieldname}  ${fieldvalue}
  Редагувати asset  ${usernamme}  ${tender_uaid}
  Input String      ${locator_item_${fieldname}.replace('item_id','${item_id}')}     ${fieldvalue}
  Зберегти зміни

Завантажити ілюстрацію в об'єкт МП
  [Arguments]  ${username}  ${tender_uaid}  ${filepath}
  uap.Завантажити документ в об'єкт МП з типом  ${username}  ${tender_uaid}  ${filepath}  illustration

Завантажити документ в об'єкт МП з типом
  [Arguments]  ${username}  ${tender_uaid}  ${filepath}  ${documentType}
  ${documentType}=  convert_common_string_to_etender_string  ${documentType}
  Завантажити документ  ${filepath}  ${documentType}

Додати актив до об'єкта МП
  [Arguments]  ${username}  ${tender_uaid}  ${item}
  ${index}=     uap.Отримати кількість активів в об'єкті МП  ${username}  ${tender_uaid}
  ${index}=     Convert To Integer  ${index}
  Редагувати asset  ${username}  ${tender_uaid}
  Wait Scroll Click  id=addItem_
  Створити об'єкт активу  ${item}  ${index}
  Зберегти зміни

Отримати кількість активів в об'єкті МП
  [Arguments]  ${username}  ${tender_uaid}
  Run Keyword And Return    Get Matching Xpath Count    xpath=//div[@ng-repeat="item in detailes.items"]

Завантажити документ для видалення об'єкта МП
  [Arguments]  ${username}  ${tender_uaid}  ${filepath}
  uap.Завантажити документ в об'єкт МП з типом  ${username}  ${tender_uaid}  ${filepath}  cancellationDetails
  Sleep  45

Видалити об'єкт МП
  [Arguments]  ${username}  ${tender_uaid}
  Reload Page
  Дочекатись зникнення blockUI
  Wait and Click  id=deleteBtn

Створити об'єкти активу
  [Arguments]  ${items}
  Log  ${items}
  ${items_count}=   Get Length  ${items}
  :FOR  ${i}  IN RANGE  ${items_count}-1
  \     Click Element   id=addItem_
  :FOR  ${i}  IN RANGE  ${items_count}
  \     Створити об'єкт активу  ${items[${i}]}  ${i}

Створити об'єкт активу
  [Arguments]  ${item}  ${index}
  Input Text    xpath=(//textarea[@ng-model='data.description'])[2]     ${item.description}
  Click Element     xpath=(//a[@ng-click='showDescription = 2'])[2]
  Input Text    xpath=(//textarea[@ng-model='data.descriptionEN'])[2]  ${item.description_en}
  Click Element     xpath=(//a[@ng-click='showDescription = 3'])[2]
  Input Text    xpath=(//textarea[@ng-model='data.descriptionRU'])[2]  ${item.description_ru}
#  ${unit}=      convert_common_string_to_etender_string     ${item.unit.name}
  Wait and Select By Label  id=itemsUnit${index}    ${item.unit.name}
  Input String  id=itemsQuantity${index}    ${item.quantity}
  ${registrationStatus}=    convert_common_string_to_etender_string  ${item.registrationDetails.status}
  Select From List By Label     id=registrationDetailsStatus${index}    ${registrationStatus}
  Обрати класифікатор   ${item.classification.id}  ${index}
  ${region}=    Set Variable If  '${item.address.region}'=='місто Київ'  Київ  ${item.address.region}
  Select From List By Label     id=region${index}   ${region}
  Run Keyword Unless  '${region}'=='Київ'  Input Text    id=newCity${index}     ${item.address.locality}
  Input Text    id=addressStr${index}  ${item.address.streetAddress}
  Input Text    id=postIndex${index}   ${item.address.postalCode}
  Дочекатись зникнення blockUI

Обрати класифікатор
  [Arguments]  ${id}  ${index}
  Wait and Click  xpath=(//input[@id='openMPC'])[${index+1}]
  Дочекатись зникнення blockUI
  Execute JavaScript  element = document.evaluate("//input[contains(@ng-model, 'searchstring')]",document.documentElement,null,XPathResult.ORDERED_NODE_SNAPSHOT_TYPE,null).snapshotItem(0);
  Execute JavaScript  element.value = '${id}';
  Execute JavaScript  angular.element(element).triggerHandler('change');
  Дочекатись зникнення blockUI
  Wait and Click    xpath=//td[contains(@code, '${id}')]
  Wait and Click    id=classification_choose
  Дочекатись зникнення blockUI

#--------------------LOT--------------------#

Створити лот
  [Arguments]  ${username}  ${tender_data}  ${asset_uaid}
  Log  ${tender_data}
  uap.Пошук об’єкта МП по ідентифікатору    ${username}  ${asset_uaid}
  Wait and Click    id=createLotBtn
  Дочекатись зникнення blockUI
  ${decision_date}=     convert_dgfDecisionDate_to_etender_format   ${tender_data.data.decisions[0].decisionDate}
  Input Text        id=decisionDate         ${decision_date}
  Input Text        id=decisionNumber       ${tender_data.data.decisions[0].decisionID}
  Click Element     id=createLot
  Sleep  15
  ${lot_id}=  Wait Until Keyword Succeeds  10 min  30 sec  Field Value Is Not Empty  id=lotidua
  Reload Page
  ${page}=    Get Location
  Set Global Variable     ${tenderpage}  ${page}
  Дочекатись зникнення blockUI
  [Return]  ${lot_id}

Оновити сторінку з лотом
  [Arguments]  ${username}  ${tender_uaid}
  Reload Page
  Дочекатись зникнення blockUI

Перейти на сторінку лота за потреби
  ${page}=    Get Location
  Return From Keyword If  '${page}'=='${tenderpage}'
  Go To  ${tenderpage}
  Дочекатись зникнення blockUI

Отримати інформацію із лоту
  [Arguments]  ${username}  ${tender_uaid}  ${fieldname}
  Перейти на сторінку лота за потреби
  Run Keyword And Return    Отримати інформацію із лоту про ${fieldname}

Отримати інформацію із лоту про lotID
  Run Keyword And Return    Get Text    id=lotidua

Отримати інформацію із лоту про status
  Reload Page
  Дочекатись зникнення blockUI
  Run Keyword And Return    Get Element Attribute    id=lotStatus@status

Отримати інформацію із лоту про date
  ${value}=     Get Text    id=lotCreationTime
  Run Keyword And Return    convert_etender_date_to_iso_format  ${value}

Отримати інформацію із лоту про rectificationPeriod.endDate
  ${value}=     Get Text    id=rectificationPeriodEnd
  Run Keyword And Return    convert_etender_date_to_iso_format  ${value}

Отримати інформацію із лоту про assets
  Run Keyword And Return    Get Text    id=assetObjectID

Отримати інформацію із лоту про title
  Run Keyword And Return    Get Text    id=titleOut

Отримати інформацію із лоту про description
  Run Keyword And Return    Get Text    id=descriptionOut

Отримати інформацію із лоту про lotHolder.name
  Run Keyword And Return    Get Text    id=assetHolderName

Отримати інформацію із лоту про lotHolder.identifier.scheme
  ${value}=     Get Text    id=assetHolderScheme
  Run Keyword And Return    convert_etender_string_to_common_string  ${value}

Отримати інформацію із лоту про lotHolder.identifier.id
  Run Keyword And Return    Get Text    id=assetHolderCode

Отримати інформацію із лоту про lotCustodian.identifier.scheme
  ${value}=     Get Text    id=assetCustodianScheme
  Run Keyword And Return    convert_etender_string_to_common_string  ${value}

Отримати інформацію із лоту про lotCustodian.identifier.id
  Run Keyword And Return    Get Text    id=assetCustodianCode

Отримати інформацію із лоту про lotCustodian.identifier.legalName
  Run Keyword And Return    Get Text    id=assetCustodianName

Отримати інформацію із лоту про lotCustodian.contactPoint.name
  Run Keyword And Return    Get Text    id=assetCustodianCPName

Отримати інформацію із лоту про lotCustodian.contactPoint.telephone
  Run Keyword And Return    Get Text    id=assetCustodianCPPhone

Отримати інформацію із лоту про lotCustodian.contactPoint.email
  Run Keyword And Return    Get Text    id=assetCustodianCPEmail

Отримати інформацію із лоту про decisions[${n}].title
  Run Keyword And Return    Get Text    id=decisionTitle${n}

Отримати інформацію із лоту про decisions[${n}].decisionDate
  ${value}=     Get Text    id=decisionDate${n}
  Run Keyword And Return    convert_etender_date_to_ymd     ${value}

Отримати інформацію із лоту про decisions[${n}].decisionID
  Run Keyword And Return    Get Text    id=decisionID${n}

Отримати інформацію із лоту про dateModified
  ${value}=     Get Text    id=lotDate
  Run Keyword And Return    convert_etender_date_to_iso_format  ${value}

Отримати інформацію із лоту про relatedProcesses[${n}].relatedProcessID
  Run Keyword And Return    Get Text    id=assetObjectID

Отримати інформацію з активу лоту
  [Arguments]  ${username}  ${tender_uaid}  ${item}  ${fieldname}
  Перейти на сторінку лота за потреби
  Run Keyword And Return  Отримати інформацію з активу лоту про ${fieldname}  ${item}

Отримати інформацію з активу лоту про description
  [Arguments]  ${item}
  Run Keyword And Return    Get Text    xpath=//div[contains(@name, '${item}')]//*[@name='description']

Отримати інформацію з активу лоту про classification.scheme
  [Arguments]  ${item}
  Run Keyword And Return    Get Text    xpath=//div[contains(@name, '${item}')]//*[@name='classification.scheme']

Отримати інформацію з активу лоту про classification.id
  [Arguments]  ${item}
  Run Keyword And Return    Get Text    xpath=//div[contains(@name, '${item}')]//*[@name='classification.id']

Отримати інформацію з активу лоту про unit.name
  [Arguments]  ${item}
  ${value}=     Get Text    xpath=//div[contains(@name, '${item}')]//*[@name='unit.name']
  Run Keyword And Return    convert_etender_string_to_common_string     ${value}

Отримати інформацію з активу лоту про registrationDetails.status
  [Arguments]  ${item}
  ${value}=     Get Text    xpath=//div[contains(@name, '${item}')]//*[@name='registrationStatus']
  Run Keyword And Return    convert_etender_string_to_common_string     ${value}

Отримати інформацію з активу лоту про quantity
  [Arguments]  ${item}
  ${value}=     Get Text    xpath=//div[contains(@name, '${item}')]//*[@name='quantity']
  Run Keyword And Return    Convert To Number   ${value}

Розділити дату та заповнити поля
  [Arguments]  ${date}
  ${startDate}  ${startTime}=     get_etender_date_from_iso   ${date}
  Wait and Input    id=auctionPeriodStart   ${startDate}
  Input String      id=auctionPeriodTime    ${startTime}

Внести зміни в лот
  [Arguments]  ${username}  ${tender_uaid}  ${fieldname}  ${fieldvalue}
  Перейти на сторінку лота за потреби
  Run keyword if   '${TEST NAME}' == 'Можливість відредагувати заголовок лоту'  Додати документ про внесення змін  ${username}  ${tender_uaid}
  Wait and Click  id=EditLot
  Wait and Input  ${locator.${fieldname}}     ${fieldvalue}
  Зберегти зміни
  Дочекатись зникнення blockUI

Додати документ про внесення змін
  [Arguments]  ${username}  ${tender_uaid}
  ${file_path}  ${file_name}  ${file_content}=  op_robot_tests.tests_files.service_keywords.Create Fake Doc
  Завантажити документ  ${filepath}  Рішення про внесення змін до інформаційного повідомлення
  Sleep  15
  uap.Оновити сторінку з лотом  ${username}  ${tender_uaid}

Внести зміни в актив лоту
  [Arguments]  ${username}  ${item_id}  ${tender_uaid}  ${fieldname}  ${fieldvalue}
  uap.Пошук лоту по ідентифікатору  ${username}  ${tender_uaid}
  Wait and Click    id=EditLot
  Sleep  1
  Clear Element Text    ${locator_item_${fieldname}.replace('item_id','${item_id}')}
  Sleep  1
  Input String      ${locator_item_${fieldname}.replace('item_id','${item_id}')}     ${fieldvalue}
  Зберегти зміни
  Дочекатись зникнення blockUI

Завантажити ілюстрацію в лот
  [Arguments]  ${username}  ${tender_uaid}  ${filepath}
  uap.Завантажити документ в лот з типом    ${username}  ${tender_uaid}  ${filepath}  illustration

Завантажити документ в лот з типом
  [Arguments]  ${username}  ${tender_uaid}  ${filepath}  ${documentType}
  Перейти на сторінку лота за потреби
  ${documentType}=  get_lot_document_name  ${documentType}
  Завантажити документ  ${filepath}  ${documentType}

Завантажити документ
  [Arguments]  ${filepath}  ${documentType}  ${locator}=tend_doc_add  ${locator2}=docType
  Wait and Select By Label  id=${locator2}  ${documentType}
  Choose File     xpath=//input[@id="${locator}"]  ${filepath}
  Sleep  15

Завантажити документ для видалення лоту
  [Arguments]  ${username}  ${tender_uaid}  ${filepath}
  uap.Завантажити документ в лот з типом    ${username}  ${tender_uaid}  ${filepath}  cancellationDetails
  Sleep  45

Видалити лот
  [Arguments]  ${username}  ${tender_uaid}
  uap.Пошук лоту по ідентифікатору  ${username}  ${tender_uaid}
  Click Element     id=DeleteLot
  Sleep  30

Додати умови проведення аукціону
  [Arguments]  ${username}  ${auction}  ${auction_index}  ${tender_uaid}
  Перейти на сторінку лота за потреби
  Run Keyword   Додати умови проведення аукціону номер ${auction_index}     ${username}  ${tender_uaid}  ${auction}

Додати умови проведення аукціону номер 0
  [Arguments]  ${username}  ${lot_uaid}  ${auction}
  Log  ${auction}
  Wait and Click    id=editAuction_0
  Розділити дату та заповнити поля  ${auction.auctionPeriod.startDate}
  Input String      id=Value                ${auction.value.amount}
  Run Keyword If    ${auction.value.valueAddedTaxIncluded}==${TRUE}   Click Element   id=valueTaxIncluded
  Input String      id=minimalStep          ${auction.minimalStep.amount}
  Input String      id=Guarantee            ${auction.guarantee.amount}
  Input Text        id=bankAccountBankName   ${auction.bankAccount.bankName}
  Input Text        id=bankAccountDescription    ${auction.bankAccount.description}
#  ${locator_id}  get_account_details_code_id  ${auction.bankAccount.accountIdentification[0].scheme}
#  Input String      id=${locator_id}  ${auction.bankAccount.accountIdentification[0].id}
  Input String      id=accountDetailsCode0  88888888
  Input String      id=accountDetailsCode1  666666
  Input String      id=accountDetailsCode2  1010101010
  Зберегти зміни
  Sleep  30

Додати умови проведення аукціону номер 1
  [Arguments]  ${username}  ${lot_uaid}  ${auction}
  Log  ${auction}
  Wait and Click    id=editAuction_1
  ${duration}=  convert_iso8601Duration  ${auction.tenderingDuration}
  Wait and Input    id=TenderingDuration  ${duration}
  Зберегти зміни
  Sleep  30
  Click Element     id=ActivateLot
  Sleep  0.5
  Page Should Not Contain  Інформаційне повідомлення не пройшло перевірку

Внести зміни в умови проведення аукціону
  [Arguments]  ${username}  ${tender_uaid}  ${fieldname}  ${fieldvalue}  ${auction_index}
  Перейти на сторінку лота за потреби
  Wait Scroll Click    id=editAuction_0
  Дочекатись зникнення blockUI
  Run Keyword If  '${fieldname}'=='auctionPeriod.startDate'  Розділити дату та заповнити поля  ${fieldvalue}
  Run Keyword And Return If  '${fieldname}'=='auctionPeriod.startDate'  Зберегти зміни
  Wait Scroll Click    ${locator_auction_${fieldname.replace('.','_')}}
  Clear Element Text    ${locator_auction_${fieldname.replace('.','_')}}
  Input String      ${locator_auction_${fieldname.replace('.','_')}}  ${fieldvalue}
  Зберегти зміни

Завантажити документ в умови проведення аукціону
  [Arguments]  ${username}  ${tender_uaid}  ${filepath}  ${documentType}  ${auction_index}
  Перейти на сторінку лота за потреби
  ${documentType}=  get_lot_document_name  ${documentType}
  Завантажити документ  ${filepath}  ${documentType}

Отримати інформацію із лоту про auctions[${n}].procurementMethodType
  ${type}=   Wait and Get Text    id=auctionType_${n}
  Run Keyword And Return    convert_etender_string_to_common_string     ${type}

Отримати інформацію із лоту про auctions[${n}].status
  ${x}  Evaluate  ${n}+1
  Run Keyword And Return    Wait and Get Attribute   xpath=(//*[@id='auctionStatus'])[${x}]  status

Отримати інформацію із лоту про auctions[${n}].tenderAttempts
  ${x}  Evaluate  ${n}+1
  ${tenderAttempts}=    Wait and Get Attribute   xpath=(//*[@id='auctionStatus'])[${x}]  tenderAttempts
  Run Keyword And Return    Convert To Integer      ${tenderAttempts}

Отримати інформацію із лоту про auctions[${n}].value.amount
  ${x}  Evaluate  ${n}+1
  ${value.amount}=  Wait and Get Text    xpath=(//*[@id='value'])[${x}]
  Run Keyword And Return    Convert To Number   ${value.amount}

Отримати інформацію із лоту про auctions[${n}].minimalStep.amount
  ${x}  Evaluate  ${n}+1
  ${minimalStep.amount}=    Wait and Get Text    xpath=(//*[@id='minimalStep'])[${x}]
  Run Keyword And Return    Convert To Number   ${minimalStep.amount}

Отримати інформацію із лоту про auctions[${n}].guarantee.amount
  ${x}  Evaluate  ${n}+1
  ${guarantee.amount}=      Wait and Get Text    xpath=(//*[@id='guarantee'])[${x}]
  Run Keyword And Return    Convert To Number   ${guarantee.amount}

Отримати інформацію із лоту про auctions[${n}].registrationFee.amount
  ${x}  Evaluate  ${n}+1
  ${registrationFee.amount}=    Wait and Get Text    xpath=(//*[@id='registrationFee'])[${x}]
  Run Keyword And Return    Convert To Number   ${registrationFee.amount}

Отримати інформацію із лоту про auctions[${n}].tenderingDuration
  ${tenderingDuration}=    Wait and Get Text    xpath=(//*[@id='tenderingDuration'])[${n}]  # n: 1 or 2
  ${duration}=  Set Variable If  '${tenderingDuration}'=='30'   P1M  P${tenderingDuration}D
  [Return]  ${duration}

Отримати інформацію із лоту про auctions[${n}].auctionPeriod.startDate
  ${startDate}=    Wait and Get Text    id=auctionStart
  Run Keyword And Return    convert_etender_date_to_iso_format   ${startDate}

Отримати інформацію із лоту про auctions[${n}].auctionID
  ${lot_id}=  Wait Until Keyword Succeeds  10 min  30 sec  Field Value Is Not Empty  id=auctionID_${n}
  [Return]  ${lot_id}

#-------------------TENDER-------------------#

Отримати інформацію із тендера
  [Arguments]  ${username}  ${tender_uaid}  ${field}
  Run Keyword And Return  Отримати інформацію із тендера про ${field}

Отримати інформацію із тендера про auctionID
  Run Keyword And Return    Wait and Get Text   id=auctionID

Отримати інформацію із тендера про title
  Run Keyword And Return    Wait and Get Text   id=title

Отримати інформацію із тендера про description
  Run Keyword And Return    Wait and Get Text   id=description

Отримати інформацію із тендера про minNumberOfQualifiedBids
  ${str}=   Wait and Get Text     id=minNumberOfQualifiedBids
  Run Keyword And Return  Convert To Number     ${str}

Отримати інформацію із тендера про procurementMethodType
  Run Keyword And Return    Get Element Attribute    id=auctionStatus@procurementMethodType

Отримати інформацію із тендера про procuringEntity.name
  Run Keyword And Return  Wait and Get Text     id=customerName

Отримати інформацію із тендера про value.amount
  ${value.amount}=          Wait and Get Text   id=value
  Run Keyword And Return    Convert To Number   ${value.amount}

Отримати інформацію із тендера про minimalStep.amount
  ${minimalStep.amount}=    Wait and Get Text   id=minimalStep
  Run Keyword And Return    Convert To Number   ${minimalStep.amount}

Отримати інформацію із тендера про guarantee.amount
  ${guarantee.amount}=      Wait and Get Text   id=guarantee
  Run Keyword And Return    Convert To Number   ${guarantee.amount}

Отримати інформацію із тендера про registrationFee.amount
  ${registrationFee.amount}=    Wait and Get Text    id=registrationFee
  Run Keyword And Return    Convert To Number   ${registrationFee.amount}

Отримати інформацію із тендера про tenderPeriod.endDate
  ${value}=  Wait and Get Text  id=tenderPeriodEnd
  Run Keyword And Return    convert_etender_date_to_iso_format  ${value}

Отримати інформацію із тендера про status
  Reload Page
  Дочекатись зникнення blockUI
  Run Keyword And Return    Get Element Attribute   id=auctionStatus@status

Отримати інформацію із тендера про cancellations[0].status
  Reload Page
  Дочекатись зникнення blockUI
  Run Keyword And Return    Get Element Attribute   id=cancellationStatus@status

Отримати інформацію із тендера про cancellations[0].reason
  Run Keyword And Return    Wait and Get Text       id=cancellationReason

Отримати інформацію із тендера про auctionPeriod.startDate
  ${value}=  Wait and Get Text  id=auctionStart
  Run Keyword And Return    convert_etender_date_to_iso_format  ${value}

Отримати інформацію із тендера про auctionPeriod.endDate
  ${value}=  Wait and Get Text  id=auctionEnd
  Run Keyword And Return    convert_etender_date_to_iso_format  ${value}

Отримати інформацію із тендера про awards[0].status
  Run Keyword And Return    Get Element Attribute   id=awardStatus@status

Отримати інформацію із предмету
  [Arguments]  ${username}  ${tender_uaid}  ${object_id}  ${field}
  Run Keyword And Return  Отримати інформацію із предмету про ${field}  ${object_id}

Отримати інформацію із предмету про description
  [Arguments]  ${item}
  Run Keyword And Return    Get Text    xpath=//div[contains(@name, '${item}')]//*[@name='description']

Отримати інформацію із предмету про classification.scheme
  [Arguments]  ${item}
  Run Keyword And Return    Get Text    xpath=//div[contains(@name, '${item}')]//*[@name='classification.scheme']

Отримати інформацію із предмету про unit.name
  [Arguments]  ${item}
  ${value}=     Get Text    xpath=//div[contains(@name, '${item}')]//*[@name='unit.name']
  Run Keyword And Return    convert_etender_string_to_common_string     ${value}

Отримати інформацію із предмету про quantity
  [Arguments]  ${item}
  ${value}=     Get Text    xpath=//div[contains(@name, '${item}')]//*[@name='quantity']
  Run Keyword And Return    Convert To Number   ${value}

Отримати інформацію із запитання
  [Arguments]  ${username}  ${tender_uaid}  ${object_id}  ${field}
  Reload Page
  Дочекатись зникнення blockUI
  Run Keyword And Return  Wait and Get Text  xpath=//div[contains(@name, '${object_id}')]//*[@name='${field}']
  #Отримати інформацію із запитання про ${field}  ${object_id}

Задати запитання на тендер
  [Arguments]  ${username}  ${tender_uaid}  ${question}
  uap.Пошук тендера по ідентифікатору  ${username}  ${tender_uaid}
  Заповнити запитання  ${question}
  Click Element     id=submit
  Sleep  10

Задати запитання на предмет
  [Arguments]  ${username}  ${tender_uaid}  ${object_id}  ${question}
  uap.Пошук тендера по ідентифікатору  ${username}  ${tender_uaid}
  Заповнити запитання  ${question}
  Select From List By Index  id=target  1
  Select From List By Index  id=targetItem  1
  Click Element     id=submit
  Sleep  10

Заповнити запитання
  [Arguments]  ${question}
  Log   ${question}
  Wait and Click    id=askQuestion
  Sleep  3
  Wait and Input    id=title    ${question.data.title}
  Wait and Input    id=description  ${question.data.description}

Отримати посилання на аукціон для глядача
  [Arguments]  ${username}  ${tender_uaid}  @{arguments}
  uap.Пошук тендера по ідентифікатору  ${username}  ${tender_uaid}
  Run Keyword And Return    Get Element Attribute  id=viewerAuctionUrl@href

Отримати посилання на аукціон для учасника
  [Arguments]  ${username}  ${tender_uaid}  @{arguments}
  uap.Пошук тендера по ідентифікатору  ${username}  ${tender_uaid}
  Run Keyword And Return    Get Element Attribute  id=participationUrl_0@href

Відповісти на запитання
  [Arguments]  ${username}  ${tender_uaid}  ${data}  ${object_id}
  Reload Page
  Дочекатись зникнення blockUI
  Wait and Click  xpath=//div[contains(@name, '${object_id}')]//*[@id='addAnswer']
  Wait and Input  xpath=//div[contains(@name, '${object_id}')]//textarea    ${data.data.answer}
  Wait and Click  xpath=//div[contains(@name, '${object_id}')]//button[@type='submit']
  Sleep  30

Подати цінову пропозицію
  [Arguments]  ${username}  ${tender_uaid}  ${bid}
  uap.Пошук тендера по ідентифікатору  ${username}  ${tender_uaid}
  Run Keyword If  '${bid.data.qualified}'=='True'  Wait and Click    xpath=//input[@ng-model='bidderAgreeChk.state']
  Wait and Click    xpath=//input[@ng-model='bidderAgreeChk.state2']
  Input String      id=amount   ${bid.data.value.amount}
  Click Element     id=addBid
  Sleep  10
  Click Element     xpath=//h4[contains(.,'Ваша пропозиція зареєстрована!')]/../..//button
  Sleep  3
  Click Element     xpath=//button[@click-and-block="activateBid(bid)"]
  Sleep  20

Змінити цінову пропозицію
  [Arguments]  ${username}  ${tender_uaid}  ${field}  ${value}
  ${file_path}  ${file_name}  ${file_content}=  op_robot_tests.tests_files.service_keywords.Create Fake Doc
  uap.Завантажити документ в ставку  ${username}  ${file_path}  ${tender_uaid}
  uap.Оновити сторінку з лотом  ${username}  ${tender_uaid}
  Wait Until Element Is Visible  id=value.amount
  Input String      id=value.amount   ${value}
  Click Element     xpath=//button[@click-and-block='updateBid(bid)']
#  Dismiss Alert
  Sleep  5
  Click Element     xpath=//button[@click-and-block='activateBid(bid)']
#  Dismiss Alert
  Sleep  10

Скасувати цінову пропозицію
  [Arguments]  ${username}  ${tender_uaid}  @{arguments}
  uap.Пошук тендера по ідентифікатору  ${username}  ${tender_uaid}
  Click Element  id=cancelBid_0

Отримати інформацію із пропозиції
  [Arguments]  ${username}  ${tender_uaid}  ${field}
  ${value}=  Wait and Get Attribute    id=${field}  amount
  Run Keyword And Return  Convert To Number     ${value}

Завантажити документ в ставку
  [Arguments]  ${username}  ${document}  ${tender_uaid}
  uap.Пошук тендера по ідентифікатору  ${username}  ${tender_uaid}
  Wait and Select By Label  id=selectDoctype2  Цінова пропозиція
  Choose File     xpath=//input[@id="addNewDocToExistingBid1_0"]  ${document}
  Sleep  15

Отримати документ
  [Arguments]  ${username}  ${tender_uaid}  ${doc_id}   #  TODO  ↓  rewrite
  #  Wait Until Keyword Succeeds  2 min  30 sec     Run Keywords  Reload Page  AND
  ${title}=     uap.Отримати інформацію із документа  ${username}  ${tender_uaid}  ${doc_id}  title
  ${href}=      Get Element Attribute  xpath=//a[contains(text(),'${doc_id}')]@href
  Run Keyword And Return    download_file_from_url  ${href}  ${OUTPUT_DIR}${/}${title}

Отримати інформацію із документа
  [Arguments]  ${username}  ${tender_uaid}  ${doc_id}  ${field}
  ${raw_value}=   Wait and Get Text  xpath=//a[contains(text(),'${doc_id}')]
  Run Keyword And Return  Конвертувати інформацію із документа про ${field}  ${raw_value}

Конвертувати інформацію із документа про title
  [Arguments]  ${raw_value}
  [Return]  ${raw_value.split(',')[0]}

Активувати процедуру
  [Arguments]  @{arguments}
  Return From Keyword

Скасувати закупівлю
  [Arguments]  ${username}  ${tender_uaid}  ${reason}  ${document}  ${description}
  uap.Пошук тендера по ідентифікатору  ${username}  ${tender_uaid}
  Wait and Click    id=cancelAuction
  Sleep  5
  Wait and Input    id=reason           ${reason}
  Click Element     id=startCancellation
  Sleep  5
  Reload Page
  Дочекатись зникнення blockUI
  Wait and Click    id=continueCancelling
  Sleep  5
  Wait and Input    id=descrinput       ${description}
  Choose File       id=tend_doc_add     ${document}
  Sleep  30
  Reload Page
  Дочекатись зникнення blockUI
  Wait and Click    id=continueCancelling
  Wait and Click    id=cancelTender



#-------------------AWARD-------------------#

Зберегти зміни в контракті
  Click Element     id=saveChanges
  Sleep  10

Відкрити вікно кваліфікації
  Wait and Click    id=qualify
  Sleep  3

Отримати кількість авардів в тендері
  [Arguments]  ${username}  ${tender_uaid}
  uap.Пошук тендера по ідентифікатору   ${username}  ${tender_uaid}
  ${count}=     Get Matching Xpath Count    xpath=//div[@ng-repeat="award in lot.awards"]
  Run Keyword And Return    Convert To Integer  ${count}

Завантажити протокол погодження в авард
  [Arguments]  ${username}  ${tender_uaid}  ${document}  ${award_index}
  uap.Пошук тендера по ідентифікатору   ${username}  ${tender_uaid}
  Відкрити вікно кваліфікації
  Завантажити документ  ${document}  Рішення про викуп  documentToAdd
  Sleep  30
  Capture Page Screenshot
  Reload Page

Активувати кваліфікацію учасника
  [Arguments]  ${username}  ${tender_uaid}
  uap.Пошук тендера по ідентифікатору   ${username}  ${tender_uaid}
  Відкрити вікно кваліфікації
  Wait and Click    id=btn_nextStepAwards
  Wait and Click    id=btn_Pending


Завантажити протокол аукціону в авард
  [Arguments]  ${username}  ${tender_uaid}  ${document}  ${award_index}
  uap.Пошук тендера по ідентифікатору   ${username}  ${tender_uaid}
  Відкрити вікно кваліфікації
  Завантажити документ  ${document}  Протокол торгів    documentToAdd
  Sleep  30
  Reload Page

Підтвердити постачальника
  [Arguments]  ${username}  ${tender_uaid}  ${award_num}
  uap.Пошук тендера по ідентифікатору   ${username}  ${tender_uaid}
  Відкрити вікно кваліфікації
  Wait and Click    id=btn_nextStepAwards
  Wait and Click    id=btn_candidateQualify
  Sleep  15

Завантажити протокол дискваліфікації в авард
  [Arguments]  ${username}  ${tender_uaid}  ${document}  ${award_index}
  uap.Пошук тендера по ідентифікатору   ${username}  ${tender_uaid}
  Відкрити вікно кваліфікації
  Завантажити документ  ${document}  Акт про відмову  documentToAdd
  Sleep  30
  Reload Page

Дискваліфікувати постачальника
  [Arguments]  ${username}  ${tender_uaid}  ${award_num}  ${description}
  uap.Пошук тендера по ідентифікатору   ${username}  ${tender_uaid}
  Відкрити вікно кваліфікації
  Wait and Click    id=btn_nextStepAwards
  Wait and Click    id=btn_disqualify

Скасування рішення кваліфікаційної комісії
  [Arguments]  ${username}  ${tender_uaid}  ${award_num}
  uap.Пошук тендера по ідентифікатору   ${username}  ${tender_uaid}
  Wait and Click    id=getGuarantee
  Wait and Click    id=btn_modalCancelAward

#-----------------CONTRACT------------------#

Завантажити протокол скасування в контракт
  [Arguments]  ${username}  ${tender_uaid}  ${document}  ${contract_num}
  uap.Пошук тендера по ідентифікатору   ${username}  ${tender_uaid}
  Wait and Click    id=btn_ContractActiveAwarded
  Завантажити документ  ${document}  Рішення про відмову у затвердженні протоколу
  Sleep  30
  Зберегти зміни в контракті

Скасувати контракт
  [Arguments]  ${username}  ${tender_uaid}  ${contract_num}
  uap.Пошук тендера по ідентифікатору   ${username}  ${tender_uaid}
  Wait and Click    id=btn_ContractActiveAwarded
  Wait and Click    id=btn_RejectionProtocol

Встановити дату підписання угоди
  [Arguments]  ${username}  ${tender_uaid}  ${contract_num}  ${date}
  uap.Пошук тендера по ідентифікатору   ${username}  ${tender_uaid}
  Wait and Click    id=btn_ContractActiveAwarded
  ${date}  ${time}=     get_etender_date_from_iso   ${date}
  Wait and Input    id=dateSigned       ${date}
  Wait and Input    id=dateSignedTime   ${time}
  Зберегти зміни в контракті

Завантажити угоду до тендера
  [Arguments]  ${username}  ${tender_uaid}  ${contract_num}  ${document}
  uap.Пошук тендера по ідентифікатору   ${username}  ${tender_uaid}
  Wait and Click    id=btn_ContractActiveAwarded
  Завантажити документ  ${document}  Підписаний договір
  Sleep  30
  Зберегти зміни в контракті

Підтвердити підписання контракту
  [Arguments]  ${username}  ${tender_uaid}  ${contract_num}
  uap.Пошук тендера по ідентифікатору   ${username}  ${tender_uaid}
  Wait and Click    id=btn_ContractActiveAwarded
  Wait and Click    id=btn_CompleteAuction


#----------------CONTRACTING------------------#

Перейти до тендера за номером договору
  [Arguments]  ${username}  ${contract_uaid}
  uap.Пошук тендера по ідентифікатору  ${username}  ${contract_uaid[:-3]}

Перейти на сторінку контрактингу
  [Arguments]  ${username}  ${contract_uaid}
  Перейти до тендера за номером договору  ${username}  ${contract_uaid}
  Wait and Click  id=contracting
  Wait and Click  id=goToContracting
  Дочекатись зникнення blockUI

Вказати дату для майлстоуну
  [Arguments]  ${date_met}
  ${date}  ${time}=     get_etender_date_from_iso   ${date_met}
  Wait and Input    id=dateMet      ${date}
  Wait and Input    id=dateMetHour  ${time}

Активувати контракт
  [Arguments]  @{arguments}
  Return From Keyword

Отримати інформацію із договору
  [Arguments]  ${username}  ${contract_uaid}  ${field_name}
  Перейти до тендера за номером договору  ${username}  ${contract_uaid}
  Run Keyword And Return  Отримати інформацію із договору про ${field_name}

Отримати інформацію із договору про status
  Run Keyword And Return  Get Element Attribute   id=contractingStatus@status

Отримати інформацію із договору про milestones[${n}].status
  Run Keyword And Return  Wait and Get Attribute  id=milestoneStatus_${n}  status

Отримати інформацію з активу в договорі
  [Arguments]  ${username}  ${contract_uaid}  ${item_id}  ${field_name}
  Перейти до тендера за номером договору  ${username}  ${contract_uaid}
  Run Keyword And Return  Отримати інформацію із предмету про description  ${item_id}

Вказати дату отримання оплати
  [Arguments]  ${username}  ${contract_uaid}  ${date_met}  ${milestone_index}
  Перейти на сторінку контрактингу  ${username}  ${contract_uaid}
  Вказати дату для майлстоуну  ${date_met}
  Wait and Click    id=met

Підтвердити відсутність оплати
  [Arguments]  ${username}  ${contract_uaid}  ${milestone_index}
  Перейти на сторінку контрактингу  ${username}  ${contract_uaid}
  Wait and Click    id=notMet

Завантажити наказ про завершення приватизації
  [Arguments]  ${username}  ${contract_uaid}  ${document}
  Перейти на сторінку контрактингу  ${username}  ${contract_uaid}
  Select From List By Index  id=docType_approval1  1
  Choose File     id=tend_doc_add_approval1  ${document}

Вказати дату прийняття наказу
  [Arguments]  ${username}  ${contract_uaid}  ${date_met}
  Перейти на сторінку контрактингу  ${username}  ${contract_uaid}
  Вказати дату для майлстоуну  ${date_met}
  Wait and Click    id=met

Підтвердити відсутність наказу про приватизацію
  [Arguments]  ${username}  ${contract_uaid}  ${document}
  Перейти на сторінку контрактингу  ${username}  ${contract_uaid}
  Завантажити документ  ${document}  Документ про відсутність наказу про завершення приватизації  tend_doc_add_approval1  docType_approval1
  Sleep  15
  Reload Page
  Wait and Click    id=notMet

Вказати дату виконання умов контракту
  [Arguments]  ${username}  ${contract_uaid}  ${date_met}
  Перейти на сторінку контрактингу  ${username}  ${contract_uaid}
  Вказати дату для майлстоуну  ${date_met}
  Wait and Click    id=met

Підтвердити невиконання умов приватизації
  [Arguments]  ${username}  ${contract_uaid}
  Перейти на сторінку контрактингу  ${username}  ${contract_uaid}
  Wait and Click    id=notMet
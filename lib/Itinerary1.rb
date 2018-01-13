class Itinerary1 < SearchFlight

  INSURANCE_CHKBOX={:id=>"insurance_confirm"}
  CONTINUE_BOOKING={:xpath=>"//input[@id='itineraryBtn']"}
  USER_ID_TXTFLD={:xpath=>"//input[@id='username']"}
  CONTINUE_SECOND={:id=>"LoginContinueBtn_1"}
  CONTINUE_TRAVELLER={:id=>"travellerBtn"}

  ADULT1_TITLE_DDDWN={:xpath=>"(//select[@id='AdultTitle1'])[1]"}
  FIRST_NAME_TXTFLD={:xpath=>"(//input[@id='AdultFname1'])[1]"}
  LAST_NAME_TXTFLD={:id=>"AdultLname1"}

  CHILD1_TITLE_DDDWN={:id=>"ChildTitle1"}
  CHILDFIRST_NAME_TXTFLD={:id=>"ChildFname1"}
  CHILDLAST_NAME_TXTFLD={:id=>"ChildLname1"}
  CHILD_DOB_DATE={:id=>"ChildDobDay1"}
  CHILD_DOB_MONTH={:id=>"ChildDobMonth1"}
  CHILD_DOB_YEAR={:id=>"ChildDobYear1"}

  INFANT_TITLE_DDDWN={:id=>"InfantTitle1"}
  INFANT_FIRST_NAME={:id=>"InfantFname1"}
  INFANT_LAST_NAME={:id=>"InfantLname1"}
  INFANT_DOB_DATE={:id=>"InfantDobDay1"}
  INFANT_DOB_MONTH={:id=>"InfantDobMonth1"}
  INFANT_DOB_YEAR={:id=>"InfantDobYear1"}
  MOBILE={:id=>"mobileNumber"}

  CREDIT_CARD_TAB={:xpath=>"//li[@id='CCTab']"}
  CREDIT_CARD_NUMBER={:id=>"creditCardNumberDisp"}
  CARD_EXPIRY_MONTH={:id=>"CcExpirationMonth"}
  CARD_EXPIRY_YEAR={:id=>"CcExpirationYear"}
  NAME={:id=>"BillName"}
  CVV={:id=>"cvvCode"}
  MAKE_PAYMENT={:id=>"paymentSubmit"}

  WAITING_MESSAGE={:id=>"acceptedCardsInfo"}

  def initialize(driver)
    super
    @driver=driver
  end

  def click(fieldname)
    case fieldname
    when 'Insurance'
      @base_page.click_element(INSURANCE_CHKBOX,"#{fieldname}")
      self
    when 'Continue-It1'
      @base_page.click_element(CONTINUE_BOOKING,"#{fieldname}")
      self
    when 'Continue-It2'
      @base_page.click_element(CONTINUE_SECOND,"#{fieldname}")
      sleep 2
      self
    when 'Continue-It3'
      @base_page.click_element(CONTINUE_TRAVELLER,"#{fieldname}")
      sleep 6
      self
    when 'Credit-Card'
      @base_page.click_element(CREDIT_CARD_TAB,"#{fieldname}")
      sleep 2
      self
    when 'MakePaymentBtn'
      @base_page.click_element(MAKE_PAYMENT,"#{fieldname}")
      self  
    else
      puts "#{fieldname} is not correct"
    end
  end

  def send_text(fieldname,value)
    case fieldname
    when 'email'
      @base_page.enter_text(USER_ID_TXTFLD,value)
    when 'Adult-FirstName'
      @base_page.enter_text(FIRST_NAME_TXTFLD,value)
    when 'Adult-LastName'
      @base_page.enter_text(LAST_NAME_TXTFLD,value)
    when 'Child-FirstName'
      @base_page.enter_text(CHILDFIRST_NAME_TXTFLD,value)
    when 'Child-LastName'
      @base_page.enter_text(CHILDLAST_NAME_TXTFLD,value)
    when 'Infant-FirstName'
      @base_page.enter_text(INFANT_FIRST_NAME,value)
    when 'Infant-LastName'
      @base_page.enter_text(INFANT_LAST_NAME,value)
    when 'Mobile-Number'
      @base_page.enter_text(MOBILE,value)
    when 'Card-Number'
      @base_page.enter_text(CREDIT_CARD_NUMBER,value)
    when 'Card-Name'
      @base_page.enter_text(NAME,value)
    when 'Card-CVV'
      @base_page.enter_text(CVV,value)
    end
  end
  
  def select_option(fieldname,value)
    case fieldname
    when 'Adult-Title'
      @base_page.select_item_by_value(ADULT1_TITLE_DDDWN,value)
    when 'Child-Title'
      @base_page.select_item_by_value(CHILD1_TITLE_DDDWN,value)
    when 'Infant-Title'
      @base_page.select_item_by_value(INFANT_TITLE_DDDWN,value)
    when 'Child-DOB-Day'
      @base_page.select_item_by_value(CHILD_DOB_DATE,value)
    when 'Child-DOB-Month'
      @base_page.select_item_by_value(CHILD_DOB_MONTH,value)
    when 'Child-DOB-Year'
      @base_page.select_item_by_value(CHILD_DOB_YEAR,value)
    when 'Infant-DOB-Day'
      @base_page.select_item_by_value(INFANT_DOB_DATE,value)
    when 'Infant-DOB-Month'
      @base_page.select_item_by_value(INFANT_DOB_MONTH,value)
    when 'Infant-DOB-Year'
      @base_page.select_item_by_value(INFANT_DOB_YEAR,value)
    when 'CardExpiryMonth'
      @base_page.select_item_by_value(CARD_EXPIRY_MONTH,value)
    when 'CardExpiryYear'
      @base_page.select_item_by_value(CARD_EXPIRY_YEAR,value)  
    end
  end
end
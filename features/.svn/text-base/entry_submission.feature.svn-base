Feature: An entry can be submitted, reviewed and approved

  Scenario: A user creates a submission
    Given I am a logged in user "sarah"
    When I go to the new entry page
      And I create a new entry
      | title  | body       | category|
      | Ponies!| No, Kitties| Products|
    Then I should see "This entry is pending"
      And the entry "Ponies!" should be pending
      
  # Scenario: A user creates an invalid entry
  #  Given I am a logged in user "sarah"
  #   When I go to the new entry page
  #     And I create a new entry
  #     | title  | body       | category_id|
  #     |""|""|""|
  #   Then I should see "Category can't be blank"
  #   Then I should see "Title can't be blank"
  #   Then I should see "Body can't be blank"

  Scenario: Pending entries do not show up on published list
    Given the pending entry
    | title       | body   | category_id|
    | Ponies are cool! | Yes, I agree, they are| 1|
    When I go to the published entries page
    Then I should not see "Ponies are cool!"
  
  
  Scenario: Administrator views pending entries
    Given the pending entry
    | title | body | category_id|
    | Ponies are cool! | Yes, I agree, they are | 2|
      And I am logged in as an admin
    When I go to the pending entries page
    Then I should see the entry "Ponies are cool!"
    
  Scenario: non-admin user cannot publish pending entries
    Given I am a logged in user "sarah"
    When I go to the new entry page
      And I create a new entry
      | title  | body       |category|
      | Ponies!| No, Kitties| Products |
    Then I should see "This entry is pending"
      And I should not see the Publish button

  Scenario: Administrator approves an entry
    Given the pending entry
    | title | body |category_id|
    | Ponies are cool! | Yes, I agree, they are |3|
      And I am logged in as an admin
    When I view the entry "Ponies are cool!"
      And I press "Publish"
    Then I should be on the pending entries page
      And I should not see "Ponies are cool!"
    When I go to the published entries page
    Then I should see "Ponies are cool!"
      And I go to the Ponies are cool! entry page
      Then I should not see "This entry is pending"

  Scenario: Administrator can easily get to the pending entries page
    Given I am logged in as an admin
      And I am on the home page
    Then I should see "pending entries"
      And I follow "pending entries"
    Then I should be on the pending entries page
    
  
  Scenario: Administrator does not see a publish link on a published entry
    

  Scenario: non-admin user cannot view the pending entries page
  # Given I am a logged in user "sarah"
  # When I go to the pending entries page
  # Then I should get an error
  #   And I should see "sorry"
  


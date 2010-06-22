Feature: 
  Ways you can browse the catalog
  
  Scenario: Viewing categories on the home page
    Given there are 2 published entries in each category
    Given I am on the home page
    Then I should see "Products"
    Then I should see "Services"
    
  @focus
  Scenario: Viewing a limited number of entries in each category on the home page
    Given there are 20 published entries in each category
    And I am on the home page
    Then there should be 5 entries shown in each category
    And I should see "view more" in each category
    And if I follow "view more"
    Then I should be on the category home page
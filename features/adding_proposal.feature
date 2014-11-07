Feature: Adding proposal

Scenario: Adding a proposal that complies 
  Given proposal title "Proposal"
  And a description "This is a proposal"
  And author nick "Author"
  When submitting
  Then proposal is added

Scenario: Failing proposal submission when title is wrong
  Given proposal title "as"
  And a description "This is a proposal"
  And author nick "Author"
  Then it should raise an error

Scenario: Failing proposal submission when description is wrong
  Given proposal title "Proposal"
  And a description " "
  And author nick "Author"
  Then it should raise an error

Scenario: Failing proposal submission when author is wrong
  Given proposal title "Proposal"
  And a description "This is a proposal"
  And author nick " "
  Then it should raise an error

Scenario: Proposal have duplicated title
  Given proposal title "Proposal"
  And a description "This is a proposal"
  And author nick "Author"
  And is submitted

  Given proposal title "Proposal"
  And a description "This is a proposal"
  And author nick "Author"
  And is submitted

  Then the second proposal should have title "Proposal-Author"
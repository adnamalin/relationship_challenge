Assumptions:
This application runs two queries: if a given investor has access to a given document & the investor ids that have access to a given document. I assumed the user would provide a valid file formatted like the example given and investors, accounts, and documents have unique ids.

How to Run:
1. Run 'runner.rb'
2.

Design:
I have three models: Investor, Account, and Document. Direct relationships are help by Investor and Document through array attributes that store ids. Indirect relationships through Accounts are found by cross-referencing the objects own accounts and the other objects accounts.

For Investors access to a document the methods return a boolean after checking it's direct and indirect documents. For Documents I iterated through the collections of prospective investors and collected where accounts overlapped then combines these with any direct investor access. The Parser is responsible for creating the objects and assigning relationships.

Testing:
My models are tested heavily, especially the parser and methods used to check access. These were really helpful during refactoring. I did not test the controller or view and did eye tests in the terminal.

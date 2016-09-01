Assumptions:
This application runs two queries: if a given investor has access to a given document & the investor ids that have access to a given document. I assumed the user would provide a valid file formatted like the example given. My terminal interface assumes the user will always input their query in the correct format, which isn't true of actual users but for the purposes of this assignment it is.

How to Run:
1. Run 'runner.rb'
2. You'll be asked for a file name.
    - Use the provided 'input_text.txt' or place your own txt file in the directory and provide it to the terminal
3. Follow the directions given for how to query or exit the program

Design:
I have three models: Investor, Account, and Document. Direct relationships are help by Investor and Document through array attributes that store ids. Indirect relationships through Accounts are found by cross-referencing the objects own accounts and the other objects accounts.

For Investors access to a document the methods return a boolean after checking it's direct and indirect documents. For Documents I iterated through the collections of prospective investors and collected where accounts overlapped then combines these with any direct investor access.

My utility classes includes: Parser, DocumentApplication, and ResultPrinter. The latter two are my controller and view. The Parser is responsible for creating the objects and assigning relationships.

Testing:
My models are tested heavily, especially the parser and methods used to check access. These were really helpful during refactoring. I did not test the controller or view and did eye tests in the terminal. 

Assumptions:
This application runs two queries: if a given investor has access to a given document & the investor ids that have access to a given document. I assumed the user would provide a valid file formatted like the example given and investors, accounts, and documents have unique ids.

How to Run (without interface):
1. Run 'runner.rb', it's set up right now with comments that prints out the results for the two questions given in the example
2. To check if an investor has access to document use the method: investor#has_access_to_doc?(document_object)
3. To check the investor ids that have access to a given doc use method: document#all_investors_with_access(arr_of_investors)

(Checkout branch with-interface if you want to use the terminal to run queries)

Design:
I have three models: Investor, Account, and Document. Direct relationships are help by Investor and Document through array attributes that store ids. Indirect relationships through Accounts are found by cross-referencing the objects own accounts and the other objects accounts.

For Investors access to a document the methods return a boolean after checking it's direct and indirect documents. For Documents I iterated through the collections of prospective investors and collected where accounts overlapped then combines these with any direct investor access. The Parser is responsible for creating the objects and assigning relationships.

Testing:
Test for all classes can be found in the spec folder.

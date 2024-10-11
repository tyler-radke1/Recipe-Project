# Steps to Run the App
Just compile it in xcode and run it! To switch the endpoint to the empty/malformed data, there is an enum used to specify which endpoint the api points to. Simply change that endpoint in the AllRecipes class to whichever for testing.

# Focus Areas: What specific areas of the project did you prioritize? Why did you choose to focus on these areas?
I focused on having a UI where the recipes looked concise, and showed all of the relevant data in a way that was simple but looked nice. I also made particular effort to use an MVVM architecture to make sure that concerns were separated and business logic was not done in the UI itself. I did this because even in a simple app, it is important to make sure code is written in a way that is testable and easily maintainable. 

# Time Spent: Approximately how long did you spend working on this project? How did you allocate your time?
I spend about 3.5 hours on the project total. The bulk of my time was spent on the additonal features, namely the sort function and the search function. The search function in particular gave me trouble because SwiftUIs default search bar doesn't enable you to add toolbar items next to it, so I had to implement my own custom searhc bar.

# Trade-offs and Decisions: Did you make any significant trade-offs in your approach?
I initially wanted to have a settings view that enabled the user to easily switch between endpoints with a toggle, and while that worked, it didn't fit in line with the project description.

# Weakest Part of the Project: What do you think is the weakest part of your project?
If I had to pick one, I'd say the tests, just because this is a fairly simple app, so while I wrote tests for the app, by its nature there weren't many tests. 


# External Code and Dependencies: Did you use any external code, libraries, or dependencies?
Yes, I used the kingfisher package, because it has an image caching system. It works well and served my needs, so I felt there was no point in creating my own when that worked just find.

# Additional Information: Is there anything else we should know? Feel free to share any insights or constraints you encountered.
The biggest contraint was apples built in search bar not suiting my needs. While the project description didn't include that, I felt searching through a list is a natural addition to such an app. 


# Configuration Options and Customization

The main entry point of a SwiftUI app - TestTaskApp.
Structure: 
1. Services
2. App
3. Screens
4. Model
5. Extensions
6. Utils
7. Fonts
8. Colors

## Configuration options and how to customize them

1. UsersListModel - can set the number of users shown on page
2. Fonts - implemented font "Nunito"Sans
3. Colors - possibility to change primaryColor, secondaryColor ect. of App

To enhance SwiftUI application further by extracting the AppConfig
settings into a separate object for better organization and maintainability.
Add localization, themeColor, ect.

## Dependencies and any external libraries used
any additional packages were not used

## Troubleshooting tips and common issues
To allow dynamic changes to the app's main color,
it's important to ensure that any additional images
used in the app are of the View type in SwiftUI: 
(it is not done yet in  InfoView)
this will lead to:
1. dynamically ChangeColors
2. maintain consistency
3. easily apply GlobalStyling



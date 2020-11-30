# RadiusApplication

# A video tutorial of this app is here: https://youtu.be/uDEzVXiJA58

# Find out more about the design of this application here: https://kassandracapretta.com/casestudies#/radius/

# Watch me explain the application and the process here: https://www.youtube.com/watch?v=TowBPLXDwuY&feature=youtu.be

Radius is a dating, networking, and friendship application. My main idea behind this app is to create accessibility to new people wherever you are — designing a way to meet with people you're already near within a bar, coffee shop, or other commercial establishments.

## These are the main functions of the application:

- Your Radius: By geofencing your particular "bar hop" and creating a radius around it, it allows for interaction within a safe and designated space, allowing a user to become invisible just by walking outside of the radius.

- Messenger: After a match is made, the connection can message each other.

- Interests: Dating, networking, and friendship are all options that the user can choose (up to all three). When first connecting, the user chooses what they're interested in the other party. By picking their interest (dating, networking, friendship), this information is auto-populated in the messenger. Ex: "James picked Networking!" as a message.

## Here are the technical features of the application:

- Onboarding, full experience and data input through Firebase

- Login / logout / signup, forgot password as well

- Messaging, full capabilities through Firestore

- Reporting a user

- Hide or display your information, through Firebase

- Geofencing and finding current location

Additonally:
Edit Preferences
View Likes
Edit Profile
Edit Questions
View Your Profile
Contact Help Center
Reach Website

Firestore Functionality:

- Create
- Read
- Update
- Delete
1. Images
2. User Info
3. User Signup / Login
- Images
- Profile Picture
- Account Pictures / User Images
- Swipe View
- User Info
- Profile page, including questions and vitals
- Match Someone
- Deny Someone
- Chat with Someone
- List Matches
- List Intentions (dating, networking, friendship)
- Flow Structure of Radius:
- Signup



The Full Account From Start to Finish as Follows:

## The Premise

I was out one night with my cousin and some friends. I had a beer in my hand at the bar and I found myself looking around at all of the different people. I began to wonder: was there anyone in this room who was as interested in code as me? Someone who wanted to talk about it? It got me thinking: why couldn’t there be an app where I could connect with other people within my radius? Find a date at the bar next door and find a friend who knows the best taco truck in town? I could make the night whatever I wanted it to be based on who I wanted meet — and it could be practically instant.

## Building out the Idea

First I researched to see if there was anything close to what I had in mind. So far no. Then, I had to further flesh out what made my app unique. Yes, I wanted radiuses, but where? And did time of day matter? All of these things had to be fully thought-out and structured.

## The Design

Because there is no funding behind this idea and I am the only designer / developer, I was able to be a little lax with the design itself. For example, I changed the color scheme three times before I finally decided on what I wanted. I created almost zero designs of the view controllers before building them — having the idea in the my head was “good enough.”

## The End in Mind

I was not sure what this app would become. Maybe it would be an instant hit? (By “instant” I mean one or two years tops) Or maybe someone would try to buy my app immediately. Either way, I decided to build like I would be giving this application to someone else. AKA, make sure it’s thorough and well thought out, with a lot of descriptions along the way of what steps I was taking.

## The Steps Taken

Here’s the meat of this blog. I’m going to break down the code as much as possible. I’m hoping to go back someday soon and create a COMPLETE breakdown (think, “Dummies Guide to Building an Entire App from Scratch with Absolutely no Experience”) — but until then, this will do.

Sign up / Sign in Authentication:
All corresponding authentication pages can be found here

Design entryPageViewController, loginViewController, signupViewController, and forgotPasswordViewController

Create new account in Firebase to hook up authentication process

Take a look at Firebase Functions to understand how this connection was coded

Create forgotPassword as a functioning View Controller which sends an email when this is triggered

New User Sign Up:
Create a thorough group of View Controllers that interact with the user: asking questions, confirming uploads and retrieving vitals about the new account

Develop picker views to give options to new users

Connect all of this new data to Firebase

Make profile pictures upload properly from phone to application and then to Firebase

Edit Profile:

Implement entire profile to be edited

Create the code for this data to be populated from Firebase for a seamless integration from data input to data output

Allow to filters to be used through on / off buttons, creating a better user experience

What I'm Working on Now:

Hard code a messenger from start to finish for a more reliable layout for messaging and connect this to Firebase (the other option would be to use an Xcode boilerplant messenger option)

Create a swipe view so that users can swipe through people that they like or dislike, choosing their interest in this person as well

Populate other users from Firebase to create a fully functioning swipe view

Design geofencing around bars / restaurants / coffee shops to allow users to use their location to swipe and connect

Create assisting pages to inform users of the application’s policy and best practices

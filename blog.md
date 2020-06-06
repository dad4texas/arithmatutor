Arithmatutor: A Ruby on Rails Portfolio Project

As a Flatiron student, I have recently been tasked with developing the third portfolio project associated with the curriculum. The project assignment is to develop a Ruby on Rails app and present it to a Flatiron instructor for review. The project must include some important concepts that have been covered throughout our Rails training. However, this post will not expound on all of the concepts and how I was able to achieve them, but rather, I would like to entertain my readers with the journey that got me from point a to point b and perhaps give the reader some insight that might help them implement their Rails project journey.

The first phase of the operation was to come up with a project that could possibly include all the concept requirements. Within the Flatiron Ruby on Rails curriculum there were a set videos, “The Todo MVC”, training videos hosted by Avi Flombaum, a founding member of the Flatiron School. I watched many of the videos and marked the time in the videos when various concepts were covered, especially concepts that were required for the project. This gave me a quick reference point to go back to and revisit these concepts if needed. At the same time, I researched projects that had been submitted by other students, to get some ideas of a project of my own. 

Finally, I decided to incorporate my teaching background into an app for people or students that are struggling with math problems. The app which I named “Arithmatutor” would really be similar to “stackoverflow”, except its focus is on a community of individuals helping each other with math problems instead of coding issues. A user can register an account, and either sign in with their, Arithmatutor account credentials or sign in with their Facebook credentials. Once signed in, the user can post their math problem. The problem itself can be viewed by the general public, but only other registered users can opt in to help another user solve his/her math problem. Also, the user can either select a category for their problem, or they can actually create a new category. The new problem form also gets school information, from the student so that other users familiar with that school can participate. Once the problem is solved the user can go to the edit function and select to deactivate the problem, or change it up a bit and resubmit it. If the user feels they no longer want to revisit the problem, the user can simply delete the math problem all together. If they do decide to deactivate the problem, it is no longer visible to the general public, but is still visible to the user that posted the problem. 

Like I said before, this project is very similar to “stackoverflow”, where, a user creates an initial post, and other users can comment on that post. There is also, an option to allow the users to email each other back and forth. 
Once I decided on building this thing out. I knew that I would need lots of resources to help me out. Keep in mind, that I have never coded before entering the Flatiron school, so sometimes all this coding can get confusing. As a former teacher, I have learned that having resources readily available, can dramatically increase one’s productivity. So, I created a Rails cheat sheet, in excel, that lists all the criteria necessary to pass the project review. Next to each set of criteria, I inserted hyperlinks to resources that covered these criteria in ways I could understand. Doing this helped me immensely. Daily, I would review my code, along with the excel cheat sheet, to see if I had completed any of the criteria listed. If I had, then I would highlight that field in green and move on. 

The big elephant in the room, was the coding part of the project, so I decided to parse each aspect of the project into small chunks of code. The Flatiron curriculum has covered creating blog apps and todo lists within the learn.co Rails module. So, I built out the basic app based on those resources, then I looked at what other functions I would like to add to the app in order to meet the requirements. I also, created what I will now call my MVC road map. I used a whiteboard, and within an hour, I was able to map out the Models, that would be required, along with controllers and views. This road map became my blueprint and would drive the course of my coding implementation

Using the road map also helped me realize that there would need to be a sessions controller for certain; something to interact with my login page, a simple form to input a username and password, but also a link_to a signup form. But wait, if I am going to have users signup for an account, then the app needs to have a user controller, model, with views. So, that when a new user visits the sight, they will have access to a new user form that takes in their username, password, email, and optional phone number, and sends that info to the database, for future reference. At the same time, a new session is created for that user to access account privileges, such as creating a new math problem, or helping other users to solve their math problems. So, you can see how using the MVC road map can help drive one’s thoughts into a development turbo drive. 

I would like to take a moment to talk about the Gems used in my project. First of all, after watching the “Todo List MVC” videos, hosted by Avi Flombaum, I decided to take Avi’s advice and incorporate some styling into to the initial creation of the app. For this, I used the bootstrap gem, and I used the slate theme from bootswatch.com. I thought that the slate background gave the app an appearance of a chalk board. Bootstrap really simplifies adding styling and I highly recommend it. I was able to create, a cool looking nav bar, buttons etc. that really make the app stand out. 

Another gem that I added was the omniauth gem accompanied by the omniauth-facebook gem. These two gems allow a user to sign into the app using their Facebook credentials. I was really very surprised as to how easy it was to add this extra cool authentication ability to my app. The other cool thing about this is that, when logging in with one’s Facebook credentials, Facebook is handling a lot of the security features. 

Finally, I added the active_model_serializers gem. Serialization takes a data structure that can be somewhat complex and flattens it out into string, which is what JSON is, so that in can be sent to another location more efficiently and then it is deserialized. Other examples of serialized data structures include xml, and yaml. This gem simplifies creating custom json responses and it allocates that action to serializers, which in essence, conforms to the separation of concerns, that make Rails such an awesome platform. For example, you can use serializers to display attributes of a user that are not delegated by the user model. The serializer acts as a helper for the associated model. I used the serializers for rendering the problem comments, from other users to a specific user’s problem post. The user serializer renders the user attributes defined within the serializer.

Though, this project was definitely not easy, I really am very happy with the final product. The main advice I can offer as you embark on your Ruby on Rails project is; Don’t get overwhelmed. It is a huge project for someone that has never coded before entering the Flatiron school. You have lots of help from cohorts and other students that are experiencing what you are going through, so take advantage of that help. Organize, your resources so that you have quick access to them. Set daily goals, for what you plan to complete each day. Attend Project Office hours, for help, or to help your class mates. During this period of “Social Distancing”, it’s nice to actually interact with other people even though it is from a distance using Zoom. Create a graphic illustration of how users will interact with the code, and the MVC necessary to make that happen. Finally, and most importantly, have fun with it. If you get to a point where you are frustrated, take a break, and go watch a funny tv show. Your brain needs a break sometimes, so give it what it needs. Get plenty of rest, when needed. Your brain works much less efficiently when you don’t get enough rest. Anyway, good luck my fellow Rails developers, I hope the information I provided here will in some way help you in your journey to become a better Rails developer.
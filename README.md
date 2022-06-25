### Setup 

First ensure that you have rails installed on your local machine. 
If running ruby -v does return 2.7 or higher you can check out the [official installation guide](https://www.ruby-lang.org/en/documentation/installation/).

After ensuring ruby is install run 

~~~
gem install rails 
~~~

After that you can clone this repository by running. 
 
 ~~~
 git clone git@github.com:linkonsat/members_only.git
 ~~~
 
 After that run the following commands in the newly installed directory.
 This will setup the db and  seed the cloned version with pre-seeded data if any exists.
 
 ~~~
 rails db:create
 rails db:migrate
 rails db:seed
 ~~~ 
 
 After letting these commands run you should be able to run.
 
 ~~~
 
 rails server
 
 ~~~
 
 At which point enter http://localhost:3000/ in your browser to visit the website locally!
 If you do not wish to do this feel free to visit the site at https://polar-crag-22146.herokuapp.com/.
 However please note that heroku tends to be a bit slower than on the local server.
 
 
 ### running tetsts.
 If you want to run all the tests simply enter 
 
 ~~~
 rspec spec
 ~~~ 
  or for a individual folder/file
  
 ~~~ 
 rspec <file path here>
 ~~~
 
 ### Lessons Learned
 1. Learned how to use active record models to create simple belong to relations
 2. How to utilize devise to handle user authentication.
 3. How to use composition and single responsibility for functions to create a JavaScript based snake game.
 4. How to use model unit tests to test my active record postgreSQL search methods.
 
 ### Roadmap 
 
 1. Add styling for current pages.
 2. Add system tests to start testing.
 3. Create a admints who can remove or edit posts
 4. Give the ability for signed in user to give an anonymous like for a anonymous post.
 5. Give the ability for users to be signed in and give an anonymous or unanonymous like.

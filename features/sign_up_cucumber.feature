Feature: Sing Up
	In order to see sing up page
	As an User
	I want to see sing up page


	Scenario: Login as User
		Given user@test.com is logged in

	Scenario: Login as Admin
		Given admin@test.com is logged in as admin

	Scenario: Admin CRUD
		Given admin@test.com is logged in as admin

		When I am on the homepage
		And I follow New Blog post
		And I fill in blog_post_title with Cucumber Test
		And I fill in blog_post_content with Lorem ipsum
		And I fill in blog_post_author with Cucumber
		And I press Create Blog post
		Then I should see Blog post was successfully created.
		
		When I am on the homepage
		And I follow Edit
		And I fill in blog_post_title with Cucumber Test 2
		And I fill in blog_post_content with Lorem ipsum 2
		And I fill in blog_post_author with Cucumber 2
		And I press Update Blog post
		Then I should see Blog post was successfully updated

		When I am on the homepage
		And I follow Show
		Then I should see Title: Cucumber Test 2 

		When I am on the homepage
		And I follow Destroy
		When I confirm popup
		Then I should see Blog post deleted sucessfully.

	Scenario: User Blog
		Given user@test.com is logged in
		Given I have a blog with title Cucumber Test
		When I am on the homepage
		Then I should not see Destroy
		And I should see Show
		And I follow Show
		Then I should see Title: Cucumber Test

	Scenario: User Try to Create a blog
		Given user@test.com is logged in
		When I am on the new blog page
		Then I should see You can't create a blog.
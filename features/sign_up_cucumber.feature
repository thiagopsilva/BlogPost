Feature: Sing Up
	In order to see sing up page
	As an User
	I want to see sing up page

	Scenario: To sign up with devise
		When I go to the sing up page
		Then I should see Sign up
		And I should see Password confirmation
		When I fill in user_email with email@cucumber.com
		And I fill in user_password with 12345678
		And I fill in user_password_confirmation with 12345678
		And I press Sign up
		Then I should see Welcome! You have signed up successfully.

	Scenario: Application
		Given I have users with email test_user@testmail.com and password password
		When I am on the signin page
		And I fill in user_email with test_user@testmail.com
		And I fill in user_password with password
		And I press Login
		Then I should see Signed in successfully
		
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


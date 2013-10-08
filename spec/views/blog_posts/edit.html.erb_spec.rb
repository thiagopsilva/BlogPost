require 'spec_helper'

describe "blog_posts/edit" do
  before(:each) do
    @blog_post = assign(:blog_post, stub_model(BlogPost,
      :title => "MyString",
      :content => "MyString",
      :author => "MyString"
    ))
  end

  it "renders the edit blog_post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", blog_post_path(@blog_post), "post" do
      assert_select "input#blog_post_title[name=?]", "blog_post[title]"
      assert_select "input#blog_post_content[name=?]", "blog_post[content]"
      assert_select "input#blog_post_author[name=?]", "blog_post[author]"
    end
  end
end

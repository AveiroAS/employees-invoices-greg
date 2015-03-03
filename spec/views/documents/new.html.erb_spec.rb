require 'rails_helper'

RSpec.describe "documents/new", type: :view do
  before(:each) do
    assign(:document, Document.new(
      :user_id => 1,
      :file_name => "MyString",
      :file_uid => "MyString",
      :name => "MyString",
      :description => "MyText",
      :amount => 1.5,
      :approved => false
    ))
  end

  it "renders new document form" do
    render

    assert_select "form[action=?][method=?]", documents_path, "post" do

      assert_select "input#document_user_id[name=?]", "document[user_id]"

      assert_select "input#document_file_name[name=?]", "document[file_name]"

      assert_select "input#document_file_uid[name=?]", "document[file_uid]"

      assert_select "input#document_name[name=?]", "document[name]"

      assert_select "textarea#document_description[name=?]", "document[description]"

      assert_select "input#document_amount[name=?]", "document[amount]"

      assert_select "input#document_approved[name=?]", "document[approved]"
    end
  end
end

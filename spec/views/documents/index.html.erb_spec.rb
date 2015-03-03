require 'rails_helper'

RSpec.describe "documents/index", type: :view do
  before(:each) do
    assign(:documents, [
      Document.create!(
        :user_id => 1,
        :file_name => "File Name",
        :file_uid => "File Uid",
        :name => "Name",
        :description => "MyText",
        :amount => 1.5,
        :approved => false
      ),
      Document.create!(
        :user_id => 1,
        :file_name => "File Name",
        :file_uid => "File Uid",
        :name => "Name",
        :description => "MyText",
        :amount => 1.5,
        :approved => false
      )
    ])
  end

  it "renders a list of documents" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "File Name".to_s, :count => 2
    assert_select "tr>td", :text => "File Uid".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end

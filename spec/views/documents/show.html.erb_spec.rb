require 'rails_helper'

RSpec.describe "documents/show", type: :view do
  before(:each) do
    @document = assign(:document, Document.create!(
      :user_id => 1,
      :file_name => "File Name",
      :file_uid => "File Uid",
      :name => "Name",
      :description => "MyText",
      :amount => 1.5,
      :approved => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/File Name/)
    expect(rendered).to match(/File Uid/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/false/)
  end
end

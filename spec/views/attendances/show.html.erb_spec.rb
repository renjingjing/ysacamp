require 'rails_helper'

RSpec.describe "attendances/show", type: :view do
  before(:each) do
    @attendance = assign(:attendance, Attendance.create!(
      :date_attended => "Date Attended",
      :postpone => false,
      :note => "Note"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Date Attended/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Note/)
  end
end

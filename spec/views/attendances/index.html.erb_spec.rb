require 'rails_helper'

RSpec.describe "attendances/index", type: :view do
  before(:each) do
    assign(:attendances, [
      Attendance.create!(
        :date_attended => "Date Attended",
        :postpone => false,
        :note => "Note"
      ),
      Attendance.create!(
        :date_attended => "Date Attended",
        :postpone => false,
        :note => "Note"
      )
    ])
  end

  it "renders a list of attendances" do
    render
    assert_select "tr>td", :text => "Date Attended".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Note".to_s, :count => 2
  end
end

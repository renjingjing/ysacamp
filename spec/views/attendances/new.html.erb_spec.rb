require 'rails_helper'

RSpec.describe "attendances/new", type: :view do
  before(:each) do
    assign(:attendance, Attendance.new(
      :date_attended => "MyString",
      :postpone => false,
      :note => "MyString"
    ))
  end

  it "renders new attendance form" do
    render

    assert_select "form[action=?][method=?]", attendances_path, "post" do

      assert_select "input#attendance_date_attended[name=?]", "attendance[date_attended]"

      assert_select "input#attendance_postpone[name=?]", "attendance[postpone]"

      assert_select "input#attendance_note[name=?]", "attendance[note]"
    end
  end
end

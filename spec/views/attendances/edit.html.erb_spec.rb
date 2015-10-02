require 'rails_helper'

RSpec.describe "attendances/edit", type: :view do
  before(:each) do
    @attendance = assign(:attendance, Attendance.create!(
      :date_attended => "MyString",
      :postpone => false,
      :note => "MyString"
    ))
  end

  it "renders the edit attendance form" do
    render

    assert_select "form[action=?][method=?]", attendance_path(@attendance), "post" do

      assert_select "input#attendance_date_attended[name=?]", "attendance[date_attended]"

      assert_select "input#attendance_postpone[name=?]", "attendance[postpone]"

      assert_select "input#attendance_note[name=?]", "attendance[note]"
    end
  end
end

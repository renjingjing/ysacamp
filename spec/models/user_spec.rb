require 'rails_helper'
# helper in rscpec_helper the enviroment load

# DSL:Domain Specific Language-In here for RSpec
RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  # just reminding you need add test

  def valid_attributes(new_attributes={})
    {first_name:"Jenny",
     last_name: "Jenny1",
     email1:     "jenny@jenny.com",
     password:  "12345678"
   }.merge(new_attributes)
  end

# describ in here meaning staring a new section of test scenatios/example
  describe "Validations" do
    it "has a email1" do
      user = User.new valid_attributes({email1: nil})
      expect(user).to be_invalid
    end

    it "has first name" do
      user = User.new valid_attributes({first_name:nil})
      # user.email1 = "qwe@qwe.com"
      expect(user).to be_invalid
    end
    # above two ex are for validates check,so in model should include two validates items

    it "requires a password" do
      # Given- a new user with invalide password
      user= User.new valid_attributes({password: nil})
      # When- save the record to db
      user.save
      # then- looking forward to password message error inside errors messages
      expect(user.errors.messages).to have_key(:password)
    end

    it "requires an email1 with a valide format" do
      user=User.new valid_attributes({email1:"@com.com"})
      user.save
      # expect(user).to be_invalid using this and without save
      expect(user.errors.messages).to have_key(:email1)
    end
  end

  describe ".full_name" do
  # for test a method
    it "returns the concatenated first name and last name if given" do
      user=User.new valid_attributes({first_name:"a",last_name:"b"})
      expect(user.full_name).to eq("a b")
    end

    it "returns the first name only if the last name is missing" do
      user=User.new valid_attributes({first_name:"a",last_name:nil})
      expect(user.full_name).to eq("a")
    end
  end


  describe " generating password hash " do
    it "generates a password digest" do
      user=User.new(valid_attributes)
      user.save
      expect(user.password_digest).to be
    end
  end

end

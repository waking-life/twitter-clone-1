require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { User.new(name: "Potus", email: "potus@example.com",
                         password: "foobar", password_confirmation: "foobar") }

  it "should be valid" do
    expect(user).to be_valid
  end

  it "should have a name" do
    user.name = ""
    expect(user).not_to be_valid
  end

  it "should have an email" do
    user.email = ""
    expect(user).not_to be_valid
  end

  it "should have a reasonable length name" do
    user.name = "a" * 51
    expect(user).not_to be_valid
  end

  it "should have a resonable length email" do
    user.email = "a" * 244 + "@example.com"
    expect(user).not_to be_valid
  end

  it "should accept valid email addresses" do
    valid_addresses = %w(user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn)
    valid_addresses.each do |valid_address|
      user.email = valid_address
      expect(user).to be_valid, "#{valid_address.inspect} should be valid"
    end
  end

  it "should reject invalid email addresses" do
    invalid_addresses = %w(user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com)
    invalid_addresses.each do |invalid_address|
      user.email = invalid_address
      expect(user).not_to be_valid, "#{invalid_address.inspect} should be invalid"
    end
  end

  it "saves email addresses as lower case" do
    mixed_case_email = "Foo@eXAmpLe.cOm"
    user.email = mixed_case_email
    user.save
    expect(mixed_case_email.downcase).to eq(user.reload.email)
  end

  it "validates email address uniqueness" do
    duplicate_user = user.dup
    duplicate_user.email = user.email.upcase
    user.save
    expect(duplicate_user).not_to be_valid
  end

  it "has a non-blank password" do
    user.password = user.password_confirmation = " " * 6
    expect(user).not_to be_valid
  end

  it "has a minimum-length password" do
    user.password = user.password_confirmation = "a" * 5
    expect(user).not_to be_valid
  end
end

require 'rails_helper'

RSpec.describe User, :type => :model do
  it "is valid with email and name" do
    kent_beck = build(:user)
    expect(kent_beck).to be_valid
  end

  it "is invalid without password" do
    password_lack_user = build(:user, password: nil, password_confirmation: nil)
    expect(password_lack_user).not_to be_valid
    expect(password_lack_user.errors.keys).to contain_exactly(:password)
  end

  it "is invalid with wrong password confirmation" do
    wrong_confirmation_user = build(:user, password: 'good_password', password_confirmation: 'bad_password')
    expect(wrong_confirmation_user).not_to be_valid
    expect(wrong_confirmation_user.errors.keys).to contain_exactly(:password_confirmation)
  end

  it "is invalid with password with 7 chars" do
    short_password = '1234567'
    short_password_user = build(:user, password: short_password, :password_confirmation => short_password)
    expect(short_password_user).not_to be_valid
    expect(short_password_user.errors.keys).to contain_exactly(:password)
  end

  it "is valid with password with 8 chars" do
    good_password = '12345678'
    good_password_user = build(:user, password: good_password, :password_confirmation => good_password)
    expect(good_password_user).to be_valid
  end

  it "is invalid without email" do
    email_lack_user = build(:user, email: nil)
    expect(email_lack_user).not_to be_valid
    expect(email_lack_user.errors.keys).to contain_exactly(:email)
  end

  it "is invalid with duplicated email" do
    email = "duplicated@example.com"
    create(:user, email: email)

    dup_email_user = build(:user, email: email)
    expect(dup_email_user).not_to be_valid
    expect(dup_email_user.errors.keys).to contain_exactly(:email)
  end

  it "is invalid without name" do
    name_lack_user = build(:user, name: nil)
    expect(name_lack_user).not_to be_valid
    expect(name_lack_user.errors.keys).to contain_exactly(:name)
  end
end

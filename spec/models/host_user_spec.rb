require 'spec_helper'

describe Blogocalypse::HostUser do
  describe "#host_user" do
    before(:each) do
      Blogocalypse.current_user_method = :current_user_blargle
    end

    it "uses its own context if it responds to the current user method" do
      class HostUserTestBare
        include Blogocalypse::HostUser

        def current_user_blargle
          return "haha fake user"
        end
      end

      HostUserTestBare.new.host_user.should == "haha fake user"
    end

    it "users the parent controller context if it's a cell and has a parent controller context" do
      class HostUserTestCell < Cell::Rails
        include Blogocalypse::HostUser
      end

      class HostUserTestController < ActionController::Base
        def make_cell
          return cell(:host_user_test)
        end

        def current_user_blargle
          "haha way fake"
        end
      end

      HostUserTestController.new.make_cell.host_user.should == "haha way fake"
    end
  end
end

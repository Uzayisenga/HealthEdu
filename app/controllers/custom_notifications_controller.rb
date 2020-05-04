class CustomNotificationsController < ApplicationController

# custom_notifications_controller.rb
def index
    @notifications = @target.notifications.group_owners_only
  end
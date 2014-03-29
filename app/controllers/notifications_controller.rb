# coding: utf-8
class NotificationsController < ApplicationController
  
  def index
    @notis = Notification.order('created_at DESC').paginate :page => params[:page], :per_page => 30
  end
  
  def new
    @noti = Notification.new
  end
  
  def create
    @noti = Notification.new(params[:notification])
    if @noti.save
      redirect_to notifications_url, notice: "创建推送成功"
    else
      render :new
    end
  end
  
end

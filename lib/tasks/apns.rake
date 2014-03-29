# coding: utf-8
# require 'apns'
# 
# namespace :apns do
#   task :send => :environment do
#     APNS.host = 'gateway.sandbox.push.apple.com'
#     APNS.pem = "#{Rails.root}/config/dev-cert.pem"
#     APNS.pass = '123456'
#     
#     APNS.feedback_host = 'feedback.sandbox.push.apple.com'
#     APNS.feedback_port = 2196
# 
#     APNS.cache_connections = true
# 
#     device_token = '9f1418513222308a905088bd1ac15636f74b343e59830ab21cfbbb5b14fe91e4'
# 
#     APNS.send_notification(device_token, "中文".encode("utf-8"))
#   end
#   
# end

namespace :apns do
  task :send => :environment do
    pusher = Grocer.pusher(
      certificate: "#{Rails.root}/config/dev-cert.pem",      # required
      passphrase:  "123456",                       # optional
      gateway:     "gateway.sandbox.push.apple.com", # optional; See note below.
      port:        2195,                     # optional
      retries:     3                         # optional
    )
    
    notification = Grocer::Notification.new(
      device_token:      "9f1418513222308a905088bd1ac15636f74b343e59830ab21cfbbb5b14fe91e4",
      alert:             "推送来自于push app",
      badge:             0,
      sound:             "siren.aiff",         # optional
      expiry:            Time.now + 60*60,     # optional; 0 is default, meaning the message is not stored
      identifier:        1234,                 # optional
      content_available: true                  # optional; any truthy value will set 'content-available' to 1
    )

    pusher.push(notification)
  end
end
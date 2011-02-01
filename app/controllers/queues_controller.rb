class QueuesController < ApplicationController
  def create
    options = {:body => params[:data], :from => "sender@test.com"}
    Resque.enqueue(QueueClient, options)
    redirect_to(root_url, :notice => "Successfully enqueued !")
  end
end
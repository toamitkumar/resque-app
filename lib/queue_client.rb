require "#{Rails.root}/config/environment"
require 'resque'

class QueueClient
  @queue = :status_update  
  
  attr_accessor :person, :options
  
  def self.perform(args)
    # find user based on email
    client = new(args)
    client.post_message
  end
  
  def find_sender
    logger.info "Message post from #{@options["from"]}"
#    @person = Individual.find(:conditions => ["notes_email = ?", @options[:from]])
  end
  
  # Post the message
  def post_message    
    logger.info "Posting message for Sender: #{@options["from"]} with Body: #{@options["body"]}"
#    MicroBlogging::Message.create!()
  end
  
  def initialize(*args)
    logger.info(args.inspect)
    @options = args.extract_options!
    find_sender
  end
  
  def logger
    @logger ||= Logger.new("#{Rails.root}/log/queue.#{Rails.env}.log")
    @logger.level = Logger::INFO
    @logger
  end
end

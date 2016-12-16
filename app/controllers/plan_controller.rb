class PlanController < ApplicationController
  def index
    require 'open-uri'
    # @doc = Nokogiri::XML(File.open("/planxml.xml"))
    @doc = Nokogiri::HTML(open('http://www.ckziu.jaworzno.pl/planxml.xml').read)
    @teachers = @doc.xpath("//teacher")
    # @doc = @doc.xpath("//teacher")


  end

  def new

  end

  def add



  end

end

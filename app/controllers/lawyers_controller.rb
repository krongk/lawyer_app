require 'nokogiri'
require 'open-uri'
class LawyersController < ApplicationController

  #get html's data
  def get_data
  url=RAILS_ROOT+"/public/bar_list.html"
  doc = Nokogiri::HTML(open(url))

  doc.css("tr").each do |line|
    if line.css('td').size ==5
      #parse to arr
      arr =[]
      line.css('td').each do |td|
         arr << td.content
      end
      # add to db
        begin
        law = Lawyer.new
          law.lawyer_name = arr[0].strip.split(',').reverse.join(' ').gsub(/'/,'') #Convert the lawyer names 
          law.status = arr[1]
          law.bar_number = arr[2].to_i
          law.city = arr[3]
          law.admission_date =("1 "+ arr[4]).to_date #parse string to date
        law.save
        rescue Exception => exc
          logger.error("#{exc.message}")
        end
    end
  end
     redirect_to ("/")
  end 
  # GET /lawyers
  # GET /lawyers.xml
  def index
    @lawyers = Lawyer.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lawyers }
    end
  end

  # GET /lawyers/1
  # GET /lawyers/1.xml
  def show
    @lawyer = Lawyer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @lawyer }
    end
  end

  # GET /lawyers/new
  # GET /lawyers/new.xml
  def new
    @lawyer = Lawyer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @lawyer }
    end
  end

  # GET /lawyers/1/edit
  def edit
    @lawyer = Lawyer.find(params[:id])
  end

  # POST /lawyers
  # POST /lawyers.xml
  def create
    @lawyer = Lawyer.new(params[:lawyer])

    respond_to do |format|
      if @lawyer.save
        flash[:notice] = 'Lawyer was successfully created.'
        format.html { redirect_to(@lawyer) }
        format.xml  { render :xml => @lawyer, :status => :created, :location => @lawyer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @lawyer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /lawyers/1
  # PUT /lawyers/1.xml
  def update
    @lawyer = Lawyer.find(params[:id])

    respond_to do |format|
      if @lawyer.update_attributes(params[:lawyer])
        flash[:notice] = 'Lawyer was successfully updated.'
        format.html { redirect_to(@lawyer) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @lawyer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /lawyers/1
  # DELETE /lawyers/1.xml
  def destroy
    @lawyer = Lawyer.find(params[:id])
    @lawyer.destroy

    respond_to do |format|
      format.html { redirect_to(lawyers_url) }
      format.xml  { head :ok }
    end
  end
  #destroy all
  def destroy_all
     Lawyer.delete_all
     respond_to do |format|
       format.html {redirect_to(lawyers_url)}
     end
  end
end

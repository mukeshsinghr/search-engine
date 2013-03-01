class SearchController < ApplicationController

 def report
    puts "-----report"
    pdf = Prawn::Document.new
    pdf.text "Hello World"
    filename = File.join(Rails.root, "app/report", "x.pdf")
    pdf.render_file filename
    send_file filename, :filename => "x.pdf", :type => "application/pdf"
 end

  end

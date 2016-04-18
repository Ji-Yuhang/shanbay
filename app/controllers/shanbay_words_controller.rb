class ShanbayWordsController < ApplicationController
    def index
        word = params[:word]
        ap word
        one = Word.find word
        jsonstr = one.json if !one.nil?
        #render :text => jsonstr
        ap jsonstr
        #byebug
        
        #begin
        data = JSON.parse jsonstr
        #rescue
            #ap "exception 1"
            #$!
            #$@
        #else
            #ap "exception 2"
        #end
        #ap data.class
        #ap data
        
        #render :json => {:name => "David"}.to_json 
        render :json => data
    end
end

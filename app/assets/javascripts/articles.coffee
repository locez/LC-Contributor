# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
@$(document).ready ->
    $(document).on "turbolinks:load", () ->
        if $("#article_article_type_trans").prop "checked"
            
            $("#trans-info").show() 
        if $("#article_article_type_self").prop "checked" 
            $("#trans-info").hide() 
            $("#self-info").show()
    
    
    $(document).on "click","#article_article_type_trans", () ->
        $("#trans-info").show() 
        $("#self-info").hide()
    
    $(document).on "click","#article_article_type_self", () ->
        $("#trans-info").hide() 
        $("#self-info").show()        

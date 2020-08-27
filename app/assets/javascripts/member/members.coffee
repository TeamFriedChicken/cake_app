# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("#member_postcode").jpostal({
    postcode : [ "#member_postcode" ],
    address  : {
                  "#member_prefecture_code" : "%3",
                  "#member_address" : "%4%5%6%7"
                }
  });
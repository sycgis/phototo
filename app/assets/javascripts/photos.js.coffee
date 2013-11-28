# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

connection = new WebSocketRails('localhost:3000/websocket')
channel = connection.subscribe('photos')

channel.bind 'new', (photo) ->
	console.log photo
	$photo = $('.photos .col-md-4:last').clone();
 
	$photo.find('h3').text photo.caption
	$photo.find('img').attr 'src', photo['image_url']
 
	$('.photos').append($photo)
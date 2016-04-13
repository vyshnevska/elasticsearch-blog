# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  # -- Masonry layout --

  # initialize for the first time on DOM ready
  $('#articles-container-data').masonry
    itemSelector: '.box'
    isFitWidth: true

  $('#articles').imagesLoaded ->
    $('#articles-container-data').masonry
      itemSelector: '.box'
      isFitWidth: true

  # -- End Masonry layout --

  $('#article_search').typeahead
    name: "article"
    remote: "/autocomplete?q=%QUERY"

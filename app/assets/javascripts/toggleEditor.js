$(function() {
  $('textarea#eg-textarea').editable({
    inlineMode: false
  });
});

$(function(){
  $( ".froala-editor" ).wrap( '<div class="blogEditor"></div>' );
  $( ".blogEditor" ).append( '<div class="cogHolder"><i class="fa fa-cog fa-2x"></i></div>' );
});

$(function() {
  $( ".fa-cog" ).click( function(){
    console.log('hit')
    $( ".blogEditor" ).toggleClass( "toggleEditor" , 500 );
  });
});

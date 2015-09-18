$(function() {
  $('textarea#eg-textarea').editable({
    inlineMode: false
  });
});

$(function(){
  $( ".froala-editor" ).wrap( '<div class="blogEditor toggleEditor"></div>' );
  $( ".blogEditor" ).append( '<div class="cogHolder"><i class="fa fa-cog fa-2x"></i></div>' );
  });

$(function() {
  $( ".fa-cog" ).click( function(){
    console.log('hit')
    $( ".blogEditor" ).toggleClass( "toggleEditor" , 500 );
  });
});

$(function(){
  $( ".fr-dropdown" ).on( "click" , function(){
    var menu = $( ".fr-dropdown-menu" );
    var dropDown = $( this ).find( menu );
    var size = $( this ).find( menu ).width();
    if ( size > 100 ){
      console.log( size );
      $( dropDown ).css( { "margin-left" : "-" + ( size - 38 ) + "px" } );
    }
  });
});

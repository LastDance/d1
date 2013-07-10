/* ===========================================================
* lookup.js
* ===========================================================
* Copyright 2012 Jordan and Huan
*
* ========================================================== */

(function($) {

  //Define global Lookup object.
  Lookup = {};

  Lookup.bindLookupImages = function(){
	  
	  $('input[type="text"]').each(function(){
		  var lookupVal = $(this).attr('lookup');
		  if(lookupVal != '' && (typeof lookupVal != 'undefined')) {
			  var imgstr = '<a href="#lookup_frame" browseUrl="' + lookupVal + '" data-toggle="modal"><img src="img/search.png" /></a>';
			  $(imgstr).insertAfter($(this));
		  }
	  });
	  
  }
  
  /**
   * * Setup method for Lookup object.
   *   Add click event for Lookup icon.
   *   Generate the frame for views to display.
   *   Show the Lookup views embeded in the frame.
   */
  Lookup.setUp = function(){
	  $('input[type="text"] + a').each(function(){
//		  $(this).on('click', function(){
		  var browseUrl = $(this).attr('browseUrl');
		  var inputID = $(this).prev().attr('id');
		  var frameID = Lookup.drawBrowseFrame();
		  $(this).on('click', function(){
			  Lookup.getViewContent(browseUrl, inputID, frameID);
		  });
//			  Lookup.showBrowse(frameID, browseUrl, inputID);
		  });
//	  });
  }
  
  //$('#' + inputId).bind('selectback', eventHandler);
  
  /**
   * Using jQuery UI to show the dialog for views.
   */
  Lookup.showBrowse = function(frameID, browseUrl, inputID){

    Lookup.getViewContent(browseUrl, inputID, frameID);

    var frameSeletor = '#' + frameID;
    $(frameSeletor).dialog({
      height: 400,
      width: 500,
      modal: true,
      close: function() {
        $(frameSeletor).remove();
      }
    });
  };
  
  /**
   * Method to draw a frame for the views to display.
   */
  Lookup.drawBrowseFrame = function(){
	    var frame = '<div id="lookup_frame" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">'
			    	+ '<div class="modal-header">'
			    	+ 	'<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>'
			    	+ 	'<h3 id="myModalLabel">Modal header</h3>'
			    	+ '</div>'
			    	+ '<div id="lookup_content_wrapper" class="modal-body">'
			    	+ 	'<p>One fine body…</p>'
			    	+ '</div>'
			    	+ '<div class="modal-footer">'
			    	+ 	'<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>'
			    	+ 	'<button class="btn btn-primary">Save changes</button>'
			    	+ '</div>'
			    + '</div>';
	    $(frame).appendTo('body');
	    return 'lookup_frame';
	  };

  /**
   * Using ajax to load the specified views content.
   */
  Lookup.getViewContent = function(browseUrl, inputID, frameID){
    //TODO:ajax request to get the view content
    $.ajax({
      type: "GET",
      url:  "browse/" + browseUrl,
      data: {
        "viewId": browseUrl
      },
      dataType: "html",
      success: function(htmlData){
        //replace the content of lookup_content_wrapper with htmldata
        $('#lookup_content_wrapper').html(htmlData);

        Lookup.addSelectLink(inputID,frameID);
      }
    });
  };

  /**
   * Add link for every first td elements, and bind click event for every links
   */
  Lookup.addSelectLink = function(inputID, frameID){
    $('#lookup_content_wrapper table tr td:first-child')
    .each(function(){
      var inputSelector = '#' + inputID;
      var value = $(this).text();
      $(this).text('');
      var link = '<a href="#">' + value + '</a>';
      $(this).html(link);

      //Add click event to the link of first column
      $(this).children('a').click(function(){
        Lookup.handleSelect.call(this, inputSelector);
        $('#' + frameID).modal("hide");
      });
    });
  };

  /**
   * Handling select event
   */
  Lookup.handleSelect = function(inputSelector) {
    var list = new Array();
    $(this).parent().parent().children().each(function(index){
      list[index] = $.trim($(this).text());
    });
    if($(inputSelector).data('events') == null
      ||typeof $(inputSelector).data('events').selectback == 'undefined') {
      //Default assign the first column value into the input element
      $(inputSelector).val(list[0]);
    } else {
      //TODO: Call user defined callback
      //method with whole row's values passing as Array'
//      $(inputSelector).trigger('selectback', [list]);
    }
  }

  
})(jQuery);


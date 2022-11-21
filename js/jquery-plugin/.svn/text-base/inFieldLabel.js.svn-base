/*
 * jQuery In-field Labels Plugin v1.0
 * http://richardscarrott.co.uk/posts/view/jquery-in-field-labels
 *
 * Copyright (c) 2010 Richard Scarrott
 *
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html
 *
 * Requires jQuery v1.3+
 *
 */

function inFieldLabel(id) {
		$(id).find(':input.infieldlabel[placeholder]').each(function() {
	  	  var $this = $(this);
	  	  if($this.val() === '') {
	  	  	$this.addClass('tordu');
	  	    $this.val($this.attr('placeholder'));
	  	  }
	  	  $this.focus(function() {
	  	  	$this.removeClass('tordu');
	  	   /*if($this.val() === $this.attr('placeholder')) {
	  	      $this.hasClass('autoresize')?$this.val('\n'):$this.val(''); // astuce pour le autoresize
	  	    }
	  	    else
	  	    {
	  	    	if($this.hasClass('autoresize')) $this.val($.trim($this.val())+'\n');
	  	    }*/
	  	   if($this.val() === $this.attr('placeholder'))  $this.val('');
	  	  });
	  	  $this.blur(function() {
	  	    if($this.val() === '') {
	  	      $this.addClass('tordu');
	  	      $this.val($this.attr('placeholder'));
	  	    }
	  	    //if($this.hasClass('autoresize')) $this.val($.trim($this.val())); // astuce pour le autoresize
	  	  });
	  	});
	}

/*$(document).ready(function() { 
	inFieldLabel();
});*/
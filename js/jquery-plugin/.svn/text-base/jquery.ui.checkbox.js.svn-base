


(function($){
	
    $.widget('ui.checkBox', {
        _init: function(){
            var that = this, 
				opts = this.options;
					
			this.visualElement = $('<span />')
				.addClass('ui-icon');
			
			if (this.element.is(':checked')) this.visualElement.addClass("ui-icon-"+opts.icon);
			
			this.element.parent().hover(
						  function (event) {
							    $(this).addClass("ui-state-hover");
							    if (!$(this).find('span').hasClass('ui-icon-'+opts.icon)) $(this).find('span').addClass("ui-icon-"+opts.icon+"-hover");
							  },
							  function (event) {
							    $(this).removeClass("ui-state-hover");
							    $(this).find('span').removeClass("ui-icon-"+opts.icon+"-hover");
							  }
						);
			
			this.element.parent().click(
					  function (event) {
						    if ($(this).find('span').hasClass('ui-icon-'+opts.icon)) {
						    	$(this).find('span').removeClass("ui-icon-"+opts.icon);
						    	$(this).find('input').removeAttr("checked");
						    }
						    else {
						    	$(this).find('span').addClass("ui-icon-"+opts.icon);
						    	$(this).find('input').attr("checked","checked");
						    }
						    if ($(this).find('span').hasClass('ui-icon-'+opts.icon))  $(this).find('span').removeClass("ui-icon-"+opts.icon+"-hover");
					  	}
					);
            	
			this.element
				.addClass('ui-helper-hidden-accessible')
				.after(this.visualElement);
			/*this.element
				.bind('click.checkBox', $.bind(this, this.reflectUI))
				.bind('focus.checkBox blur.checkBox', toggleHover);
				*/
        },
		
        disable: function(){
            this.element[0].disabled = true;
            this.reflectUI({type: 'manuallyDisabled'});
        },
		
        enable: function(){
            this.element[0].disabled = false;
            this.reflectUI({type: 'manuallyenabled'});
        },
		
        toggle: function(e){
            this.changeCheckStatus((this.element.is(':checked')) ? false : true, e);
        },
        
        unchecked: function(e){
            this.changeCheckStatus(false, e);
        }
    });
    $.ui.checkBox.defaults = {
        replaceInput: true,
		addLabel: true
    };
})(jQuery);



jQuery.fn.gather = function (all,attr) {
	var ids = [];
	$.each($(this), function(i, elem){
		if (all==true || all==undefined && $(elem).is(':checked')) 
		{
			ids.push(attr==undefined ? elem.value :$(elem).attr(attr));
		} 
	});
	return ids;
};



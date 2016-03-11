;(function($) {

    $.fn.ssdVerticalNavigation = function(options) {

        "use strict";

        var settings = $.extend({
            classMaster : 'master',
            classActive : 'active',
            classClickable : 'clickable'
        }, options);

        function _leftNavigationActiveMain(thisLi) {

            "use strict";

            thisLi
                .toggleClass(settings.classActive)
                .siblings()
                .removeClass(settings.classActive1);
        }


        function _leftNavigationClick(thisParentUl, thisLi, event) {

            "use strict";

            if (thisParentUl.hasClass(settings.classMaster) && ! thisLi.hasClass(settings.classClickable)) {

                event.preventDefault();
                event.stopPropagation();

                _leftNavigationActiveMain(thisLi);

            }

        }


        return this.each(function() {

            "use strict";

            $(this)
                .addClass(settings.classMaster)
                .on('click',  'li a', function(event) {
                	
                if($(this).contents(2).hasClass('glyphicon glyphicon-triangle-right leftNavIcon')){
                	this.childNodes[1].className='glyphicon glyphicon-triangle-bottom leftNavIcon'; 
                }else if($(this).contents(2).hasClass('glyphicon glyphicon-triangle-bottom leftNavIcon')){
                	this.childNodes[1].className='glyphicon glyphicon-triangle-right leftNavIcon'
                }
                
                try {

                    var thisA = $(this),
                        thisLi = thisA.parent('li'),
                        thisParentUl = thisLi.parent('ul');

                    _leftNavigationClick(thisParentUl, thisLi, event);

                } catch (errorMessage) {

                    console.log(errorMessage);

                }

            });

        });


    }

}(jQuery));
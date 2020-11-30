(function($) {

    $(document).ready(function() {

        /* ==========================================================================
                    * 變數
        ==========================================================================*/
        h = $(window).height();
        w = $(window).width();
        var $body = $('body');
        var $nav = $('.nav-main');
        var $navUl = $('.nav-main > ul');
        var $navli = $('.nav-main > ul > .nav-main-item');
        var $navlia = $('.nav-main > ul > .nav-main-item > a');
        var $navActive = $('.nav-main > ul > .active');
        var $navBg = $('.nav-bg');
        var $subnavwp = $('.sub-nav-wp');
        var $navproduct = $('#nav-product');
        var $jqimgFill = $('.jqimgFill');
        var $navbartoggler = $('#navbar-toggler');
        var $header = $('#header');
        var percent = 1;

        var $htmlBody = $("html , body"),
            $goTop = $('.goTop'),
            $win = $(window);

        $('body').loadie(percent);
        resizeCss();
        $("#header").each(function() {
            nav();
        });
        /* ==== collapse ====*/
        var $collapse = $('.collapse');
        var $collapseitem = $collapse.find('.collapse-item');
        var $collapsetitle = $collapse.find('.collapse-title');
        var $collapseinfo = $collapse.find('.collapse-info');
        $collapse.each(function() {
            $collapsetitle.click(function() {
                $(this).parent().siblings().find($collapseinfo).slideUp();
                $(this).next($collapseinfo).slideToggle();
                return false;
            });
            return false;
        });

		//Top
        $goTop.click(function(){
            $htmlBody.stop(true,false).animate({scrollTop:0},500,"easeOutCirc");
            return false;
        });

        /* ==== news ====*/
        $('#picslider').each(function() {
            $(this).sliderPro({
                width: 750,
                height: 500,
                orientation: 'vertical',
                loop: false,
                arrows: false,
                buttons: false,
                thumbnailsPosition: 'right',
                thumbnailPointer: false,
                thumbnailWidth: 180,
                thumbnailHeight: 120,
                breakpoints: {
                    800: {
                        thumbnailsPosition: 'bottom',
                        thumbnailHeight: 120
                    },
                    500: {
                        thumbnailsPosition: 'bottom',
                        thumbnailHeight: 100
                    }
                }
            });
        });
        /* ==== aside-nav ====*/
        var $navaside = $('.nav-aside');
        var $hassuba = $('.has-sub > a');
        var $subnav2 = $('.nav-aside').find('.sub-nav2');
        $navaside.each(function() {
            $hassuba.click(function() {
                $(this).parent().siblings().find($subnav2).slideUp();
                $(this).next($subnav2).slideDown();
                return false;
            });
        });
        /* ==== about ====*/
        var $aboutEvents = $('.aboutEvents');
        $aboutEvents.each(function() {
            $('.about-more').click(function() {
                $aboutEvents.find(".list.active").last().next().addClass('active');
                $aa = $aboutEvents.find(".list.active").last().next().is(".list");
                if ($aa) {
                    return false;
                } else {
                    $(this).addClass('none');
                    return false;
                }
            });
        });
        /* ==== prdocut ====*/
        $(".simpleTable").stupidtable();
        $('.tab-wp').each(function() {
            $('.label').click(function() {
                $namelink = $(this).attr("href");
                $('html,body').animate({
                    scrollTop: $($namelink).offset().top - 60
                }, 800);
            });
        });
        /* ===
        = productPdf ====*/
        var $productPdf = $('#productPdf');
        var $pdfsubnav = $('.pdf-sub-nav');
        var $hassub = $('.hassub');
        $productPdf.each(function() {
            $hassub.click(function() {
                $name = $(this).attr("href");
                $(this).siblings().removeClass("active");
                $($name).siblings().slideUp();
                $(this).addClass("active");
                $($name).slideToggle(200);
                return false;
            });
        });
        /* ==== dropdown-toggle ====*/
        var $dropdowntoggle = $('.dropdown-toggle');
        var $dropdownmenu = $('.dropdown-menu');
        $dropdowntoggle.click(function() {
            $(this).next($dropdownmenu).slideToggle(200);
        });
        /* ==== banner ====*/
        var $bannerslider = $('#banner .slider');
        $bannerslider.each(function() {
            $(this).slick({
                dots: true,
                infinite: true,
                speed: 500,
                cssEase: 'linear',
                autoplay: true,
                autoplaySpeed: 5000,
                arrows: false,
            });
        });
        var $bannerslider = $('#banner-career .slider');
        $bannerslider.each(function() {
            $(this).slick({
                dots: true,
                infinite: true,
                speed: 500,
                cssEase: 'linear',
                autoplay: true,
                autoplaySpeed: 5000,
                arrows: false,
            });
        });
        /* ==== widget-len ====*/
        var $widgetlen = $('#widget-len');
        var $widgetlenshow = $('#widget-len-show');
        var $widgetshow = $('.widget-show');
        $widgetlen.click(function() {
            $widgetpartnersshow.slideUp();
            $widgetsearchshow.slideUp();
            $widgetlenshow.slideToggle(200);
            return false;
        });
        /* ==== widget-partners ====*/
        var $widgetpartners = $('#widget-partners');
        var $widgetpartnersshow = $('#widget-partners-show');
        $widgetpartners.click(function() {
            $widgetlenshow.slideUp();
            $widgetsearchshow.slideUp();
            $widgetpartnersshow.slideToggle(200);
            return false;
        });
        /* ==== widget-search ====*/
        var $widgetsearch = $('#widget-search');
        var $widgetsearchshow = $('#widget-search-show');
        $widgetsearch.click(function() {
            $widgetlenshow.slideUp();
            $widgetpartnersshow.slideUp();
            $widgetsearchshow.slideToggle(200);
            return false;
        });
        /* ==== news-home ====*/
        var $indexsolutions = $('#index-solutions');
        var $indexsolutions_list = $indexsolutions.find('.list');
        var $indexsolutions_prev = $indexsolutions.find('.slider-prev');
        var $indexsolutions_next = $indexsolutions.find('.slider-next');

        $indexsolutions.find('.list').slick({
            infinite: true,
            slidesToShow:6,
            slidesToScroll: 1,
			//centerMode: true,
            arrows: false,
            autoplay: true,
            autoplaySpeed: 2000,
			speed : 1000,
            responsive: [{
                breakpoint: 1557,
                settings: {
                    slidesToShow: 4,
                    slidesToScroll: 1,
                    //centerMode: true,
                    focusOnSelect: true,
                    centerPadding: '0px',
                }
            },{
                breakpoint: 1199,
                settings: {
                    slidesToShow: 3,
                    slidesToScroll: 1,
                   // centerMode: true,
                    focusOnSelect: true,
                    centerPadding: '0px',
                }
            },{
                breakpoint: 500,
                settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1,
                   // centerMode: true,
                    focusOnSelect: true,
                    centerPadding: '0px',
                }
            }]
        });

        $indexsolutions_prev.click(function() {
            $indexsolutions_list.slick('slickPrev');
        });
        $indexsolutions_next.click(function() {
            $indexsolutions_list.slick('slickNext');
        });

		/* ==== recruitSilder ====*/
        $('.recruitSilder').slick({
            infinite: false,
            slidesToShow: 3,
            slidesToScroll: 1,
            arrows: true,
            autoplay: false,
            autoplaySpeed: 2000,
            responsive: [{
                breakpoint: 768,
                settings: {
                    slidesToShow: 2,
                    slidesToScroll: 1,
                    focusOnSelect: true,
                    centerPadding: '0px',
                }
            },
            {
                breakpoint: 400,
                settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1,
                    focusOnSelect: true,
                    centerPadding: '0px',
                }
            }]
        });

        /* ==== lightcase ====*/
        var $lightcase = $('a[data-rel^=vehicle]');
        $lightcase.each(function() {
            $(this).lightcase({
                maxWidth: 1200,
                maxHeight: 800,
                width: 1200,
                height: 800,
            });
        });
        /* ==== vehicle-pic ====*/
        var $vehiclepic = $("#vehicle-pic");
        var $vehiclepic_btnleft = $(".btn-left");
        var $vehiclepic_btnright = $(".btn-right");
        var $vehiclepic_content = $vehiclepic.find('.content');
        $vehiclepic.each(function() {
            $vehiclepic_btnleft.click(function() {
                $vehiclepic_content.removeClass("actived");
                $vehiclepic_btnright.removeClass("active");
                $(this).addClass("active");
            });
            $vehiclepic_btnright.click(function() {
                $vehiclepic_content.addClass("actived");
                $(this).addClass("active");
                $vehiclepic_btnleft.removeClass("active");
            });
        });
        /* ==== vehicle-color ====*/
        var $vehiclecolor = $('#vehicle-color');
        var $vehiclecolorfor = $vehiclecolor.find('.slider-for');
        var $vehiclecolornav = $vehiclecolor.find('.slider-nav');
        $vehiclecolor.each(function() {
            //判斷列表數不足
            $vehiclecolorleg = $vehiclecolornav.find('.list-item').length;
            $vehicleShow = 9;
            if ($vehiclecolorleg < $vehicleShow) {
                $vehiclecolornav.addClass('noSlider');
            }
            $vehiclecolorfor.slick({
                slidesToShow: 1,
                slidesToScroll: 1,
                arrows: false,
                fade: true,
                asNavFor: '.slider-nav'
            });
            $vehiclecolornav.slick({
                slidesToShow: $vehicleShow,
                slidesToScroll: 1,
                asNavFor: '.slider-for',
                dots: false,
                centerMode: false,
                focusOnSelect: true,
                centerPadding: '0px',
            });
        });
        /* ==== about ====*/
        var $aboutdetails1 = $('#about-details-1');
        $aboutdetails1.each(function() {
            $(this).find('.list').slick({
                infinite: true,
                slidesToShow: 5,
                slidesToScroll: 1,
                centerMode: true,
                centerPadding: '0px',
                focusOnSelect: true,
                variableWidth: true,
                responsive: [{
                    breakpoint: 1680,
                    settings: {
                        slidesToShow: 3,
                        slidesToScroll: 1,
                        centerPadding: '0px',
                    }
                }, {
                    breakpoint: 767,
                    settings: {
                        slidesToShow: 1,
                        slidesToScroll: 1,
                    }
                }]
            });
            $(this).find('.slick-current').prev().addClass('c2');
            $(this).find('.slick-current').prev().prev().addClass('c1');
            $(this).find('.slick-current').next().addClass('c3');
            $(this).find('.slick-current').next().next().addClass('c4');
            $(this).find('.list').on('beforeChange', function(event, slick, currentSlide, nextSlide) {
                $(this).find('.list-item').removeClass('c1').removeClass('c2').removeClass('c3').removeClass('c4');
                $(this).find('.list-item[data-slick-index="' + nextSlide + '"]').prev().addClass('c2');
                $(this).find('.list-item[data-slick-index="' + nextSlide + '"]').prev().prev().addClass('c1');
                $(this).find('.list-item[data-slick-index="' + nextSlide + '"]').next().addClass('c3');
                $(this).find('.list-item[data-slick-index="' + nextSlide + '"]').next().next().addClass('c4');
            });
        });
        /* ==========================================================================
        * function
         ==========================================================================*/
        /* ==== 形狀 ====*/
        function pro64() {
            $(".pro64").each(function() {
                ph = $(this).width();
                $(this).css("height", ph * 0.6);
            });
        }

        function pro64list() {
            $(".pro64-list").each(function() {
                ph = $(this).find(".list-item:nth-child(1) .pic").width();
                $(this).find(".pic").css("height", ph * 0.6);
            });
        }
        /* ==== 選單 ====*/
        function nav() {
            h = $(window).height();
            w = $(window).width();
            $navActiveW = $navActive.width();


            if ($navActiveW != null)
            {
                $navActiveP = $navActive.position().left;
            }
            else
            {
                $navActiveW = '0';
                $navActiveP = '0';
            }

            $navBg.css("width", $navActiveW);
            $navBg.css({
                width: $navActiveW + 'px',
                left: $navActiveP + 'px',
            });
            if (w > 991) {
                $subnavwp.removeClass("active");
            }
            $nav.unbind("mouseenter").on('mouseenter', "li.nav-main-item", function(e) {
                if (w > 991) {
                    $widgetshow.slideUp();
                    var $this = $(this);
                    $thisW = $this.width();
                    $thisL = $this.position().left;
                    $(this).find($navproduct).addClass("active");
                    $navBg.addClass("animated");
                    $navBg.css({
                        width: $thisW + 'px',
                        left: $thisL + 'px',
                    });
                }
            }).unbind("mouseleave").on('mouseleave', "li.nav-main-item", function() {
                if (w > 991) {
                    $(this).find($navproduct).removeClass("active");
                }
            });
            $navUl.unbind("mouseleave").on('mouseleave', function() {
                if (w > 991) {
                    $navActiveW = $navActive.width();
                    $navActiveP = $navActive.position().left;
                    $navBg.css("width", $navActiveW);
                    $navBg.css({
                        width: $navActiveW + 'px',
                        left: $navActiveP + 'px',
                    });
                }
            });

            /* ==== header max-lg  star ====*/
            $navbartoggler.unbind("click").click(function() {
                if (w < 991) {
                    $header.toggleClass("active");
                    $subnavwp.removeClass("active");
                }

            });
            $('.header-top .bg').click(function() {
                headerhas = $header.hasClass("active");
                if (headerhas) {
                    $header.toggleClass("active");
                    $subnavwp.removeClass("active");
                }
            });
            $navlia.unbind("click").click(function() {
                if (w < 991) {
                    $subnavwp.removeClass("active");
                    $navliaHas = $(this).next().is($subnavwp);
                    if ($navliaHas) {
                        $(this).next($subnavwp).toggleClass("active");
                        return false;
                    }
                }
            });

        }

        $('.model-trigger').unbind('click').click(function() {
        	console.log(11111);
            $('.shop-modal-wrapper').addClass('is-open');
        });

        $('.model-close').unbind('click').click(function() {
            event.preventDefault();
            $('.shop-modal-wrapper').removeClass('is-open');
        });

        /* ==== page scroll up and down ====*/
        function headerFixed() {
            h = $(window).height();
            var $this = $(this),
            	$this_Top = $this.scrollTop();
            if ($this_Top < 75) {
                $header.removeClass("fixed");
            }
            if ($this_Top > 75) {
                $header.addClass("fixed");
            }
        }
        $(window).bind('scroll', function() {
            headerFixed();

			 if ( $(this).scrollTop() > 400){
                $goTop.fadeIn("fast");

            } else {
                $goTop.stop().fadeOut(300);
            }

        }).scroll();

		var $proSeries = $("#proSeries");
        $proSeries.each(function(){

            var $proTitleTop = $proSeries.find(".proTitleTop"),
                proTitleTopH = $proTitleTop.height(),
                $proTitlP = $proTitleTop.find('p'),
                $listWrapper = $proSeries.find(".listWrapper"),
                listWrapperOffset = $listWrapper.offset(),
                listWrapperH = $listWrapper.outerHeight(true),
                $listH3 = $listWrapper.find("h3"),
				$testTop = $proSeries.find(".testTop"),
                $proBanner = $proSeries.find(".banner"),
                $mainHeader = $proSeries.find(".main-header"),
                $goProTop = $proTitleTop.find(".goProTop")
                ;

            var  $listArray = [];

			  $.each( $listH3 , function(i){

				  var $h3eq =$listH3.eq(i), //第幾個
					  h3OffsetTop =  $h3eq.offset().top,   //get h3's top
					  h3OffsetBottom =  $h3eq.closest('.list-product').outerHeight(true); //get wrapper's h

				  $listArray.push({
					  $listProduct: $h3eq,
					  top: Math.round(h3OffsetTop) ,
					  bottom:  Math.round(h3OffsetTop + h3OffsetBottom),
					  listH3 : $(this).text()
				  });

			  });//end each
			  //console.table($listArray);

            $win.on('scroll' , function(){

                var showed = $proTitleTop.hasClass('showed'), //boolean
                    scrollTop = $win.scrollTop(),
                    headerH = $header.height();

                if ( $win.scrollTop() + 60 >= listWrapperOffset.top ) {
                    //add showed
                    if( !showed ){
                        $proTitleTop.addClass('showed');
                    }

                    //replace h3 text
                    scrollTop += proTitleTopH;
                    for (var i = 0; i < $listArray.length; i++) {
                        var content = $listArray[i];
                        if (scrollTop >= content.top && scrollTop < content.bottom) {
                            $proTitlP.text( content.listH3 )
							$proTitlP.attr("data-h" , content.top )

							$proTitlP.data("that", content.$listProduct)
                        }
                    }
                } else {
                    if( showed ){
                        $proTitleTop.removeClass('showed');
                    }
                    $proTitlP.text( '' )
                }
            }).scroll();//end on scrocll

			var isClick = false;
            $proTitlP.on('click',function(event){
                event.preventDefault();

                isClick = true;

                var dataH = $proTitlP.attr("data-h" );
                var that = $proTitlP.data('that');
               // console.log(that.offset().top);

                $htmlBody.stop().animate({
                    scrollTop: that.offset().top - 50
                },500,"easeOutCirc" , function(){
                    isClick = false;
                });
            });//end on click

            $goProTop.on('click',  function(event) {
                event.preventDefault();

                var _proBannerH = $proBanner.outerHeight(true),
                    _mainHeaderH = $mainHeader.outerHeight(true);


                $htmlBody.stop().animate({
                    scrollTop: _proBannerH +  _mainHeaderH -50
                },500,"easeOutCirc" , function(){
                    isClick = false;
                });

            });//end on click


            $('.add-inquery-link').unbind('click').click(function() {
                event.preventDefault();
                console.log('111');
                $('.pro-request-modal-wrapper, .pro-request-modal')
                    .addClass('is-open');

                $('body').css({
                    'overflow-y': 'scroll',
                    'height': 'scroll'
                });
                $('html').css('overflow-y', 'hidden');
            });

            $('.modal-close').unbind('click').click(function() {
                event.preventDefault();
                $('.pro-request-modal-wrapper, .pro-request-modal-wrapper .modal')
                    .removeClass('is-open');

                $('body').css({
                    'overflow-y': 'auto',
                    'height': 'auto'
                });

                $('html').css('overflow-y', 'auto');

            });

            $('.feedback-trigger').unbind('click').click(function() {
                event.preventDefault();
                $('.pro-request-modal').removeClass('is-open',function (argument) {
                     $('.pro-feedback-modal').addClass('is-open');
                });
            });

            $('.go-require-page').on('click',  function(event) {
                event.preventDefault();
                window.location.replace('add-inquiry.aspx');
            });



        });//end each

        /* ==========================================================================
                    * resize
        ==========================================================================*/
        $(window).bind("debouncedresize", function() {
            h = $(window).height();
            w = $(window).width();
            resizeCss();
            nav();
        });

        function resizeCss() {
            h = $(window).height();
            w = $(window).width();
            $jqimgFill.each(function() {
               // $(this).focusPoint();
            });

            $(".imgLiquidFill").imgLiquid({
                fill: true,
                horizontalAlign: "center",
                verticalAlign: "center"
            });

            /*判斷螢幕是否旋轉*/
            if (h < w) {
                $("body").addClass('landscape'); /*橫*/
                $body.removeClass('upright'); /*直*/
            } else {
                $body.removeClass('landscape');
                $("body").addClass('upright');
            }
            $(".max-lg-size").each(function() {
                $navBg.removeClass("animated");
            });
            pro64();
            pro64list();

            $(".min-lg-size").each(function() {
                $(".scroll-dark").mCustomScrollbar({theme:"dark"});
            });



        }


		$(".jqimgFill").imgLiquid({
             fill: true,
             horizontalAlign: "center",
             verticalAlign: "top"
       });

    });
    /* ==========================================================================
        * load
    ==========================================================================*/
    $(window).load(function() {
        $(".productFast-row .col").each(function() {
            /*卷軸*/
            var amount = Math.max.apply(Math, $(this).map(function() {
                return $(this).outerWidth(true);
            }).get());
            $(".myscrollbar-product").mCustomScrollbar({
                axis: "x",
                advanced: {
                    autoExpandHorizontalScroll: true
                },
                scrollButtons: {
                    enable: true,
                    scrollType: "stepped"
                },
                keyboard: { scrollType: "stepped" },
                snapAmount: amount,
                mouseWheel: { scrollAmount: amount }
            });
        });
    });
    $(".myscrollbar").mCustomScrollbar({
        axis: "x",
    });






    $('#loading').fadeOut(1000);
    new WOW().init();
})(jQuery);;

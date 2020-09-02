// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("chartkick")
require("packs/jquery")
require("packs/popper")
require("packs/metisMenu")
require("packs/bootstrap")
require("packs/select2")
require("packs/slick")
require("packs/jquerycounterup")
require("packs/counterup")
require("packs/custom")
require("packs/slickmin")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
// Animations init
//= require trix



$(function() {
  "use strict";

//Loader
$(function preloaderLoad() {
      if($('.preloader').length){
          $('.preloader').delay(200).fadeOut(300);
      }
      $(".preloader_disabler").on('click', function() {
          $("#preloader").hide();
      });
  });

// Count
$(window).on('load', function() {
  $('.bc_sec_last li h4').counterUp({
    delay: 100,
    time: 800
  });
});

// Script Navigation
! function(n, e, i, a) {
  n.navigation = function(t, s) {
    var o = {
        responsive: !0,
        mobileBreakpoint:992,
        showDuration: 300,
        hideDuration: 300,
        showDelayDuration: 0,
        hideDelayDuration: 0,
        submenuTrigger: "hover",
        effect: "fade",
        submenuIndicator: !0,
        hideSubWhenGoOut: !0,
        visibleSubmenusOnMobile: !1,
        fixed: !1,
        overlay: !0,
        overlayColor: "rgba(0, 0, 0, 0.5)",
        hidden: !1,
        offCanvasSide: "left",
        onInit: function() {},
        onShowOffCanvas: function() {},
        onHideOffCanvas: function() {}
      },
      u = this,
      r = Number.MAX_VALUE,
      d = 1,
      f = "click.nav touchstart.nav",
      l = "mouseenter.nav",
      c = "mouseleave.nav";
    u.settings = {};
    var t = (n(t), t);
    n(t).find(".nav-menus-wrapper").prepend("<span class='nav-menus-wrapper-close-button'>✕</span>"), n(t).find(".nav-search").length > 0 && n(t).find(".nav-search").find("form").prepend("<span class='nav-search-close-button'>✕</span>"), u.init = function() {
      u.settings = n.extend({}, o, s), "right" == u.settings.offCanvasSide && n(t).find(".nav-menus-wrapper").addClass("nav-menus-wrapper-right"), u.settings.hidden && (n(t).addClass("navigation-hidden"), u.settings.mobileBreakpoint = 99999), v(), u.settings.fixed && n(t).addClass("navigation-fixed"), n(t).find(".nav-toggle").on("click touchstart", function(n) {
        n.stopPropagation(), n.preventDefault(), u.showOffcanvas(), s !== a && u.callback("onShowOffCanvas")
      }), n(t).find(".nav-menus-wrapper-close-button").on("click touchstart", function() {
        u.hideOffcanvas(), s !== a && u.callback("onHideOffCanvas")
      }), n(t).find(".nav-search-button").on("click touchstart", function(n) {
        n.stopPropagation(), n.preventDefault(), u.toggleSearch()
      }), n(t).find(".nav-search-close-button").on("click touchstart", function() {
        u.toggleSearch()
      }), n(t).find(".megamenu-tabs").length > 0 && y(), n(e).resize(function() {
        m(), C()
      }), m(), s !== a && u.callback("onInit")
    };
    var v = function() {
      n(t).find("li").each(function() {
        n(this).children(".nav-dropdown,.megamenu-panel").length > 0 && (n(this).children(".nav-dropdown,.megamenu-panel").addClass("nav-submenu"), u.settings.submenuIndicator && n(this).children("a").append("<span class='submenu-indicator'><span class='submenu-indicator-chevron'></span></span>"))
      })
    };
    u.showSubmenu = function(e, i) {
      g() > u.settings.mobileBreakpoint && n(t).find(".nav-search").find("form").slideUp(), "fade" == i ? n(e).children(".nav-submenu").stop(!0, !0).delay(u.settings.showDelayDuration).fadeIn(u.settings.showDuration) : n(e).children(".nav-submenu").stop(!0, !0).delay(u.settings.showDelayDuration).slideDown(u.settings.showDuration), n(e).addClass("nav-submenu-open")
    }, u.hideSubmenu = function(e, i) {
      "fade" == i ? n(e).find(".nav-submenu").stop(!0, !0).delay(u.settings.hideDelayDuration).fadeOut(u.settings.hideDuration) : n(e).find(".nav-submenu").stop(!0, !0).delay(u.settings.hideDelayDuration).slideUp(u.settings.hideDuration), n(e).removeClass("nav-submenu-open").find(".nav-submenu-open").removeClass("nav-submenu-open")
    };
    var h = function() {
        n("body").addClass("no-scroll"), u.settings.overlay && (n(t).append("<div class='nav-overlay-panel'></div>"), n(t).find(".nav-overlay-panel").css("background-color", u.settings.overlayColor).fadeIn(300).on("click touchstart", function(n) {
          u.hideOffcanvas()
        }))
      },
      p = function() {
        n("body").removeClass("no-scroll"), u.settings.overlay && n(t).find(".nav-overlay-panel").fadeOut(400, function() {
          n(this).remove()
        })
      };
    u.showOffcanvas = function() {
      h(), "left" == u.settings.offCanvasSide ? n(t).find(".nav-menus-wrapper").css("transition-property", "left").addClass("nav-menus-wrapper-open") : n(t).find(".nav-menus-wrapper").css("transition-property", "right").addClass("nav-menus-wrapper-open")
    }, u.hideOffcanvas = function() {
      n(t).find(".nav-menus-wrapper").removeClass("nav-menus-wrapper-open").on("webkitTransitionEnd moztransitionend transitionend oTransitionEnd", function() {
        n(t).find(".nav-menus-wrapper").css("transition-property", "none").off()
      }), p()
    }, u.toggleOffcanvas = function() {
      g() <= u.settings.mobileBreakpoint && (n(t).find(".nav-menus-wrapper").hasClass("nav-menus-wrapper-open") ? (u.hideOffcanvas(), s !== a && u.callback("onHideOffCanvas")) : (u.showOffcanvas(), s !== a && u.callback("onShowOffCanvas")))
    }, u.toggleSearch = function() {
      "none" == n(t).find(".nav-search").find("form").css("display") ? (n(t).find(".nav-search").find("form").slideDown(), n(t).find(".nav-submenu").fadeOut(200)) : n(t).find(".nav-search").find("form").slideUp()
    };
    var m = function() {
        u.settings.responsive ? (g() <= u.settings.mobileBreakpoint && r > u.settings.mobileBreakpoint && (n(t).addClass("navigation-portrait").removeClass("navigation-landscape"), D()), g() > u.settings.mobileBreakpoint && d <= u.settings.mobileBreakpoint && (n(t).addClass("navigation-landscape").removeClass("navigation-portrait"), k(), p(), u.hideOffcanvas()), r = g(), d = g()) : k()
      },
      b = function() {
        n("body").on("click.body touchstart.body", function(e) {
          0 === n(e.target).closest(".navigation").length && (n(t).find(".nav-submenu").fadeOut(), n(t).find(".nav-submenu-open").removeClass("nav-submenu-open"), n(t).find(".nav-search").find("form").slideUp())
        })
      },
      g = function() {
        return e.innerWidth || i.documentElement.clientWidth || i.body.clientWidth
      },
      w = function() {
        n(t).find(".nav-menu").find("li, a").off(f).off(l).off(c)
      },
      C = function() {
        if (g() > u.settings.mobileBreakpoint) {
          var e = n(t).outerWidth(!0);
          n(t).find(".nav-menu").children("li").children(".nav-submenu").each(function() {
            n(this).parent().position().left + n(this).outerWidth() > e ? n(this).css("right", 0) : n(this).css("right", "auto")
          })
        }
      },
      y = function() {
        function e(e) {
          var i = n(e).children(".megamenu-tabs-nav").children("li"),
            a = n(e).children(".megamenu-tabs-pane");
          n(i).on("click.tabs touchstart.tabs", function(e) {
            e.stopPropagation(), e.preventDefault(), n(i).removeClass("active"), n(this).addClass("active"), n(a).hide(0).removeClass("active"), n(a[n(this).index()]).show(0).addClass("active")
          })
        }
        if (n(t).find(".megamenu-tabs").length > 0)
          for (var i = n(t).find(".megamenu-tabs"), a = 0; a < i.length; a++) e(i[a])
      },
      k = function() {
        w(), n(t).find(".nav-submenu").hide(0), navigator.userAgent.match(/Mobi/i) || navigator.maxTouchPoints > 0 || "click" == u.settings.submenuTrigger ? n(t).find(".nav-menu, .nav-dropdown").children("li").children("a").on(f, function(i) {
          if (u.hideSubmenu(n(this).parent("li").siblings("li"), u.settings.effect), n(this).closest(".nav-menu").siblings(".nav-menu").find(".nav-submenu").fadeOut(u.settings.hideDuration), n(this).siblings(".nav-submenu").length > 0) {
            if (i.stopPropagation(), i.preventDefault(), "none" == n(this).siblings(".nav-submenu").css("display")) return u.showSubmenu(n(this).parent("li"), u.settings.effect), C(), !1;
            if (u.hideSubmenu(n(this).parent("li"), u.settings.effect), "_blank" == n(this).attr("target") || "blank" == n(this).attr("target")) e.open(n(this).attr("href"));
            else {
              if ("#" == n(this).attr("href") || "" == n(this).attr("href")) return !1;
              e.location.href = n(this).attr("href")
            }
          }
        }) : n(t).find(".nav-menu").find("li").on(l, function() {
          u.showSubmenu(this, u.settings.effect), C()
        }).on(c, function() {
          u.hideSubmenu(this, u.settings.effect)
        }), u.settings.hideSubWhenGoOut && b()
      },
      D = function() {
        w(), n(t).find(".nav-submenu").hide(0), u.settings.visibleSubmenusOnMobile ? n(t).find(".nav-submenu").show(0) : (n(t).find(".nav-submenu").hide(0), n(t).find(".submenu-indicator").removeClass("submenu-indicator-up"), u.settings.submenuIndicator ? n(t).find(".submenu-indicator").on(f, function(e) {
          return e.stopPropagation(), e.preventDefault(), u.hideSubmenu(n(this).parent("a").parent("li").siblings("li"), "slide"), u.hideSubmenu(n(this).closest(".nav-menu").siblings(".nav-menu").children("li"), "slide"), "none" == n(this).parent("a").siblings(".nav-submenu").css("display") ? (n(this).addClass("submenu-indicator-up"), n(this).parent("a").parent("li").siblings("li").find(".submenu-indicator").removeClass("submenu-indicator-up"), n(this).closest(".nav-menu").siblings(".nav-menu").find(".submenu-indicator").removeClass("submenu-indicator-up"), u.showSubmenu(n(this).parent("a").parent("li"), "slide"), !1) : (n(this).parent("a").parent("li").find(".submenu-indicator").removeClass("submenu-indicator-up"), void u.hideSubmenu(n(this).parent("a").parent("li"), "slide"))
        }) : k())
      };
    u.callback = function(n) {
      s[n] !== a && s[n].call(t)
    }, u.init()
  }, n.fn.navigation = function(e) {
    return this.each(function() {
      if (a === n(this).data("navigation")) {
        var i = new n.navigation(this, e);
        n(this).data("navigation", i)
      }
    })
  }
}
(jQuery, window, document), $(document).ready(function() {
  $("#navigation").navigation()
});

// Tooltip
$('[data-toggle="tooltip"]').tooltip();

// Bottom To Top Scroll Script
$(window).on('scroll', function() {
  var height = $(window).scrollTop();
  if (height > 100) {
    $('#back2Top').fadeIn();
  } else {
    $('#back2Top').fadeOut();
  }
});

$("#back2Top").on('click', function(event) {
  event.preventDefault();
  $("html, body").animate({ scrollTop: 0 }, "slow");
  return false;
});


// Script For Fix Header on Scroll
$(window).on('scroll', function() {
  var scroll = $(window).scrollTop();

  if (scroll >= 50) {
    $(".header").addClass("header-fixed");
  } else {
    $(".header").removeClass("header-fixed");
  }
});

// Brand Slide
// smart_textimonials_style
$('#brand-slide').slick({
  slidesToShow:5,
  arrows: false,
  autoplay:true,
  dots: false,
  responsive: [
  {
    breakpoint:1024,
    settings: {
    arrows: false,
    slidesToShow:4
    }
  },
  {
    breakpoint: 768,
    settings: {
    arrows: false,
    slidesToShow:3
    }
  },
  {
    breakpoint: 480,
    settings: {
    arrows: false,
    slidesToShow:2
    }
  }
  ]
});


// smart_textimonials_style
$('#testimonials_style').slick({
  slidesToShow:1,
  arrows: true,
  autoplay:true,
  dots: false,
  responsive: [
  {
    breakpoint: 768,
    settings: {
    arrows: true,
    slidesToShow:1
    }
  },
  {
    breakpoint: 480,
    settings: {
    arrows: true,
    slidesToShow:1
    }
  }
  ]
});

// smart_textimonials_style
$('#four_slide').slick({
  slidesToShow:4,
  arrows: true,
  autoplay:true,
  dots: false,
  responsive: [
  {
    breakpoint:1199,
    settings: {
    arrows: true,
    slidesToShow:3
    }
  },
  {
    breakpoint: 768,
    settings: {
    arrows: true,
    slidesToShow:2
    }
  },
  {
    breakpoint: 480,
    settings: {
    arrows: true,
    slidesToShow:1
    }
  }
  ]
});

// smart_textimonials_style
$('#three_slide').slick({
  slidesToShow:3,
  arrows:true,
  autoplay:true,
  dots:true,
  responsive: [
  {
    breakpoint: 800,
    settings: {
    arrows: false,
    slidesToShow:2
    }
  },
  {
    breakpoint: 480,
    settings: {
    arrows: false,
    slidesToShow:1
    }
  }
  ]
});

// Slide For No Arrow Four
$('.four_slide').slick({
  slidesToShow:4,
  arrows: true,
  autoplay:true,
  dots: false,
  responsive: [
  {
    breakpoint:1199,
    settings: {
    arrows: true,
    slidesToShow:3
    }
  },
  {
    breakpoint: 768,
    settings: {
    arrows: true,
    slidesToShow:2
    }
  },
  {
    breakpoint: 480,
    settings: {
    arrows: true,
    slidesToShow:1
    }
  }
  ]
});

// Slide For No Arrow Three
$('.three_slide').slick({
  slidesToShow:3,
  arrows:true,
  autoplay:true,
  dots:false,
  responsive: [
  {
    breakpoint: 800,
    settings: {
    arrows: false,
    slidesToShow:2
    }
  },
  {
    breakpoint: 480,
    settings: {
    arrows: false,
    slidesToShow:1
    }
  }
  ]
});

// Slide For dots Four
$('.four_slide-dots').slick({
  slidesToShow:4,
  arrows: true,
  autoplay:true,
  dots: true,
  responsive: [
  {
    breakpoint:1199,
    settings: {
    arrows: true,
    slidesToShow:3
    }
  },
  {
    breakpoint: 768,
    settings: {
    arrows: true,
    slidesToShow:2
    }
  },
  {
    breakpoint: 480,
    settings: {
    arrows: true,
    slidesToShow:1
    }
  }
  ]
});

// Slide For dots Three
$('.three_slide-dots').slick({
  slidesToShow:3,
  arrows:true,
  autoplay:true,
  dots:true,
  responsive: [
  {
    breakpoint:800,
    settings: {
    arrows: false,
    slidesToShow:2
    }
  },
  {
    breakpoint: 480,
    settings: {
    arrows: false,
    slidesToShow:1
    }
  }
  ]
});


// Select Job category
$('#c-category').select2({
  placeholder: "Choose Category",
  allowClear: true
});

// country
$('#country').select2({
  placeholder: "Choose Country",
  allowClear: true
});

});
!function(a,b,c){function d(b,c){this.element=a(b),this.settings=a.extend({},f,c),this._defaults=f,this._name=e,this.init()}var e="metisMenu",f={toggle:!0,doubleTapToGo:!1};d.prototype={init:function(){var b=this.element,d=this.settings.toggle,f=this;this.isIE()<=9?(b.find("li.active").has("ul").children("ul").collapse("show"),b.find("li").not(".active").has("ul").children("ul").collapse("hide")):(b.find("li.active").has("ul").children("ul").addClass("collapse in"),b.find("li").not(".active").has("ul").children("ul").addClass("collapse")),f.settings.doubleTapToGo&&b.find("li.active").has("ul").children("a").addClass("doubleTapToGo"),b.find("li").has("ul").children("a").on("click."+e,function(b){return b.preventDefault(),f.settings.doubleTapToGo&&f.doubleTapToGo(a(this))&&"#"!==a(this).attr("href")&&""!==a(this).attr("href")?(b.stopPropagation(),void(c.location=a(this).attr("href"))):(a(this).parent("li").toggleClass("active").children("ul").collapse("toggle"),void(d&&a(this).parent("li").siblings().removeClass("active").children("ul.in").collapse("hide")))})},isIE:function(){for(var a,b=3,d=c.createElement("div"),e=d.getElementsByTagName("i");d.innerHTML="<!--[if gt IE "+ ++b+"]><i></i><![endif]-->",e[0];)return b>4?b:a},doubleTapToGo:function(a){var b=this.element;return a.hasClass("doubleTapToGo")?(a.removeClass("doubleTapToGo"),!0):a.parent().children("ul").length?(b.find(".doubleTapToGo").removeClass("doubleTapToGo"),a.addClass("doubleTapToGo"),!1):void 0},remove:function(){this.element.off("."+e),this.element.removeData(e)}},a.fn[e]=function(b){return this.each(function(){var c=a(this);c.data(e)&&c.data(e).remove(),c.data(e,new d(this,b))}),this}}(jQuery,window,document);
(function(e){"use strict";e.fn.counterUp=function(t){var n=e.extend({time:400,delay:10},t);return this.each(function(){var t=e(this),r=n,i=function(){var e=[],n=r.time/r.delay,i=t.text(),s=/[0-9]+,[0-9]+/.test(i);i=i.replace(/,/g,"");var o=/^[0-9]+$/.test(i),u=/^[0-9]+\.[0-9]+$/.test(i),a=u?(i.split(".")[1]||[]).length:0;for(var f=n;f>=1;f--){var l=parseInt(i/n*f);u&&(l=parseFloat(i/n*f).toFixed(a));if(s)while(/(\d+)(\d{3})/.test(l.toString()))l=l.toString().replace(/(\d+)(\d{3})/,"$1,$2");e.unshift(l)}t.data("counterup-nums",e);t.text("0");var c=function(){t.text(t.data("counterup-nums").shift());if(t.data("counterup-nums").length)setTimeout(t.data("counterup-func"),r.delay);else{delete t.data("counterup-nums");t.data("counterup-nums",null);t.data("counterup-func",null)}};t.data("counterup-func",c);setTimeout(t.data("counterup-func"),r.delay)};t.waypoint(i,{offset:"100%",triggerOnce:!0})})}})(jQuery);

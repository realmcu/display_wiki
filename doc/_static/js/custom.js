/* ================ Add left-sider draggable component ================ */

function addLefTocSlider(local_left_nav_width) {
    const initLeftTocSliderWidth = function() {
        if (window.matchMedia('(min-width: 768px)').matches) {
            let leftSiderBarWidth = localStorage.getItem(local_left_nav_width);
            if (leftSiderBarWidth) {
                $('.wy-nav-side').css('width', leftSiderBarWidth + 'px');
                $('.wy-nav-content-wrap').css('margin-left', leftSiderBarWidth + 'px');
            }
        } else {
            $('.wy-nav-side').css('width', '');
            $('.wy-nav-content-wrap').css('margin-left', '');
        }
    };

    // init left toc slider width if stored width exists in localStorage
    initLeftTocSliderWidth();

    let leftResizing = false;

    $('.wy-nav-side')
        .append('<span class="resize-handle-left"> || </span>')
        .on('mousedown', 'span.resize-handle-left', function(e) {
            leftResizing = true;
            e.preventDefault(); // 阻止默认的文本选中行为
        });

    $(document).on('mousemove', function(e) {
        if (!leftResizing)
            return;

        e.preventDefault(); // 阻止默认的文本选中行为

        var offsetNew = e.clientX - document.body.offsetLeft;
        // 限制导航栏宽度
        if (offsetNew > 200 && offsetNew < 800) {
            $('.wy-nav-side').css('width', offsetNew + 'px');
            $('.wy-nav-content-wrap').css('margin-left', offsetNew + 'px');
        }
    }).on('mouseup', function(e) {
        if (leftResizing) {
            leftResizing = false;

            // Store width in localStorage
            var newWidth = $('.wy-nav-side').width();
            localStorage.setItem(local_left_nav_width, newWidth);
        }
    });

    // Also adjust width on window resize
    $(window).resize(function() {
        initLeftTocSliderWidth();
    });
}

/* ================ Initialize on document ready ================ */
$(document).ready(function() {
    // Get left_nav_width from html_context
    var leftNavWidth = window.html_context && window.html_context.left_nav_width 
        ? window.html_context.left_nav_width 
        : 'docs.displaywiki.sidebar.width';
    
    addLefTocSlider(leftNavWidth);
});

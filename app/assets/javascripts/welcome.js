var hasLoaded = false;

$(function() {
    if (hasLoaded) {
      $.fn.fullpage.destroy('all');
    }
    $('#fullpage').fullpage({
      sectionsColor: ['#76DB9F', '#4BBFC3', 'whitesmoke'],
      fixedElements: '#header',
    });
    hasLoaded = true;
});

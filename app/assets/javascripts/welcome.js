var hasLoaded = false;

$(function() {
    if (hasLoaded) {
      $.fn.fullpage.destroy('all');
    }
    $('#fullpage').fullpage({
      // sectionsColor: ['#76DB9F', '#4BBFC3', 'whitesmoke'],
      // fixedElements: '#header',
    });
    hasLoaded = true;

    $('#possible_start_1').datetimepicker();
    $('#possible_end_1').datetimepicker();
    $('#possible_start_2').datetimepicker();
    $('#possible_end_2').datetimepicker();
    $('#possible_start_3').datetimepicker();
    $('#possible_end_1').datetimepicker();

});

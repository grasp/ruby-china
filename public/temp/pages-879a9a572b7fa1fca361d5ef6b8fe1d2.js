(function() {
  $(document).ready(function() {
    $("<div id='preview' class='wikistyle'></div>").insertAfter($('#page_body'));
    $('.edit a').click(function() {
      $(this).parent().addClass('active');
      $('.preview a').parent().removeClass('active');
      $('#preview').hide();
      $('#page_body').show();
      return false;
    });
    return $('.preview a').click(function() {
      $(this).parent().addClass('active');
      $('.edit a').parent().removeClass('active');
      $('#preview').html('Loading...');
      $('#page_body').hide();
      $('#preview').show();
      $.post('/wiki/preview', {
        body: $('#page_body').val()
      }, function(data) {
        $('#preview').html(data);
        return false;
      });
      return false;
    });
  });

}).call(this);

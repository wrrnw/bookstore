$(document).ready(function(){
  // jQuery methods go here...
  $('.nav-link').click(function() {
    $('.nav-link').removeClass('active');
    $(this).addClass('active');
    $('.tables').hide();
    if ($(this).text() == "db_book") {
      $('.db_book').show();
    } else if ($(this).text() == "db_customer") {
      $('.db_customer').show();
    } else if ($(this).text() == "db_employee") {
      $('.db_employee').show();
    } else if ($(this).text() == "db_order") {
      $('.db_order').show();
    } else if ($(this).text() == "db_orderdetail") {
      $('.db_orderdetail').show();
    } else if ($(this).text() == "db_shipper") {
      $('.db_shipper').show();
    } else if ($(this).text() == "db_subject") {
      $('.db_subject').show();
    } else if ($(this).text() == "db_supplier") {
      $('.db_supplier').show();
    }
  });

});

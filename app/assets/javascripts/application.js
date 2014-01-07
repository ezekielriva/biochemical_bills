//= require jquery
//= require jquery_ujs
//= require handlebars-v1.3.0
//= require_self

var order_line = {
  $el: $('#order_lines_fieldset'),
  template: Handlebars.compile( $('#add_item_template').html() ),

  addItem: function() {
    var time = new Date();
    var data = { timestamp: time.getTime() };
    var html = this.template(data);

    this.$el.append(html);
  },

  removeItem: function() {},

  init: function() {
    var that = this;
    $('#add_item').on('click', function() {
      that.addItem();
    });
  }
}

$(document).ready(function() {
  order_line.init();
});

//= require jquery
//= require jquery_ujs
//= require foundation
//= require handlebars-v1.3.0
//= require typeahead.min
//= require hogan-2.0.0
//= require_self

var order_line = {
  $el: $('#order_lines_fieldset'),
  template: Handlebars.compile( $('#add_item_template').html() || '' ),

  addItem: function() {
    var time = new Date();
    var data = { timestamp: time.getTime() };
    var html = this.template(data);

    this.$el.append(html);
    typeahead_module.init();
  },

  removeItem: function() {},

  init: function() {
    var that = this;
    $('#add_item').on('click', function(e) {
      e.preventDefault();
      that.addItem();
    });
  }
}

var typeahead_module = {
  $typeahead: [],
  init: function() {
    this.$typeahead = $('[data-module*=typeahead]');
    this.$typeahead.typeahead({
      name:'bioPractices',
      valueKey: 'id',
      remote: '/admin/bio_practices?query=%QUERY',
      template: ['<p>Codigo: {{id}} <br/>',
                 '{{name}} - ub: {{ub}}</p>'].join(''),
      engine: Hogan
    })
  },
}

$(document).ready(function() {
  order_line.init();
  typeahead_module.init();
});

$(function(){ $(document).foundation(); });

#= require active_admin/base
#= require active_admin/select2
#= require jquery.multiple.select

ready = ->
  $('#project_target_ids').multipleSelect({
  	placeholder: "Selecccionar Target"
  });
  $('#project_subcategory_ids').multipleSelect({
  	placeholder: "Selecccionar Subcategorias"
  });
  $('#post_target_ids').multipleSelect({
  	placeholder: "Selecccionar Target"
  });
  $('#post_subcategory_ids').multipleSelect({
  	placeholder: "Selecccionar Subcategorias"
  });


$(document).ready(ready);
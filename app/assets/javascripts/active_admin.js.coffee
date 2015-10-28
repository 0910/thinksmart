#= require active_admin/base
#= require active_admin/select2

$ ->

  $('#project_category_id').change ->
    category_id = $(this).val()
    $.ajax
      type: 'GET'
      url: '/admin/subcategories.json'
      data: category_id: category_id
      dataType: 'json'
      success: (data) ->
        $.each data, (index, element) ->
          cat = data[index].category_id
          if data[index].category_id == category_id
            $('#project_relation_ids').append '<option id="' + data[index].id + '">' + data[index].title + '</option>'
          return
        return
    return
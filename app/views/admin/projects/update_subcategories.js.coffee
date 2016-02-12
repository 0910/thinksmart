$("#project_subcategory_ids").empty()
  .append("<%= escape_javascript(render(:partial => @subctegories)) %>")
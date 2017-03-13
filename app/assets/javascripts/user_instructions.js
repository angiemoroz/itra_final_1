
$(document).ready(function(){
	if(!$('#user_instruction_tag_list')[0]){return;}
	var path = '/' + $('#user_instruction_tag_list')[0].baseURI.split('/').slice(3, 5).join('/');
  console.log(path)
	var id = $('#user_instruction_tag_list')[0].baseURI.split('/')[4];
  if(id=='new'){
    activateSelect2();
    return;
  }
	var selectedTags = [];
	$.ajax({
	  type: 'GET',
	  url: path + '/get_appropriate_tags',
	  data: {id: id},
	  success: function(data) {
	    var list = $('#tags_list');
	    tagsLength = data.length;
	    if(data.length != 0){
	      var lis = '';
	      for(var i = 0; i < data.length; i++){
	        lis += '<option value="' + i + "\" selected=\"selected\">" + data[i] + '</option>\n';
	        selectedTags[i] = i;
	      }
	      list.html(lis);
	    }
	    activateSelect2();
	  }
	});

  function activateSelect2(){
    var $select = $(".js-data-example-ajax").select2({
      tags: true,
      tokenSeparators: [',', ' '],
      ajax: {
        url: path + '/get_all_tags',
        dataType: 'json',
        delay: 250,
        data: function (params) {
          return {
            word: params.term, // search term
            page: params.page
          };
        },
        processResults: function (data, params) {
          params.page = params.page || 1;
          return {
            results: $.map( data, function(d, i) { 
              return { id: i, text: d, val: 'val'+ i} 
            }),
            pagination: {
              more: (params.page * 30) < data.total_count
            }
          };
        },
        cache: true
      }
    });
      $select.val(selectedTags).trigger("change"); 
  };
});

function onClickFunction(){
		var tags = $('.select2-selection__rendered li');
		var result = '';
		for(var i = 0; i < tags.length - 1; i++){
		  result += tags[i].title + ',';
		}
		$('#user_instruction_tag_list')[0].value = result; 
}
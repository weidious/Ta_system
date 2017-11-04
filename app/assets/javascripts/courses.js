
console.log($("#tab_all_stu")[0].rows.length);


var add_role = function(typ, uin, name) {
  var topls;
  var color;
  if (typ == "TA") {
    topls = $("#ls_ta");
    color = 'btn-success';
  } else if (typ == "Grader") {
    topls = $("#ls_grader");
    color = 'bg-info';
  } else if (typ == "Senior Grader") {
    topls = $("#ls_sgrader");
    color = 'btn-warning';
  } else return false;
  
  var count = parseInt(topls.attr("count"), 10);
  count = count + 1;
  if (count > 5) {
    alert("Maximal 5");
    return false;
  }
  topls.attr("count", count);
  topls.append("<td><button type='button' class='btn " + color + "' name='" + uin + "'>" + name + "</button></td>")
}

var remove_role = function(typ, uin) {
  
}


$("#tab_all_stu tr").each(function() {
  $this = $(this);
  
  $this.find("select").on('focusin', function(){
    $(this).data('val', $(this).val());
  });
    
  $this.find("select").change(
    function() {
      
    var prev = $(this).data('val');
    console.log("prev " + prev);
    
      var typ = $(this).val();
      var name = $(this).parent()[0].parentNode.cells[0].textContent;
      var uin = $(this).parent()[0].parentNode.cells[1].textContent;
      var ok = add_role(typ, uin, name);
      if (!ok) {
        console.log("failed", typ, name, uin);
      }
      if (prev) {
        remove_role(typ, uin);
      }
      
    });
});

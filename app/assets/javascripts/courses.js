
console.log($("#tab_all_stu")[0].rows.length);


var add_role = function(typ, uin, name) {
  var topls;
  var color;
  if (typ == "ta") {
    topls = $("#ls_ta");
    color = 'btn-success';
  } else if (typ == "grader") {
    topls = $("#ls_grader");
    color = 'bg-info';
  } else if (typ == "sgrader") {
    topls = $("#ls_sgrader");
    color = 'btn-warning';
  } else return false;
  
//  console.log("ta: " + uin  + "  " + $("#ls_ta").find("td[name=" + uin + "]").length);
  
//     if ($("#ls_ta").find("td[name=" + uin + "]").length) {
//       alert("Already assigned as TA");
// //     return false;
//     }
//  $("#ls_grader").find("td[name=" + uin + "]").remove();
//  $("#ls_sgrader").find("td[name=" + uin + "]").remove();
  
  var count = parseInt(topls.attr("count"), 10);
  count = count + 1;
  if (count > 5) {
    alert("Maximal 5 Candidates!");
    return false;
  }
  topls.append("<td name='" + uin + "'><button type='button' class='btn " + color + "'>" + name + "</button></td>");
  topls.attr("count", count);
  return true;
}

var remove_role = function(uin) {
  // console.log($("#ls_ta").find("td[name=" + uin + "]").remove());
  $("#ls_ta").find("td[name=" + uin + "]").remove();
  $("#ls_grader").find("td[name=" + uin + "]").remove();
  $("#ls_sgrader").find("td[name=" + uin + "]").remove();
  
   $("#ls_ta").attr("count", ($("#ls_ta").find("td").length - 1));
   $("#ls_grader").attr("count", ($("#ls_grader").find("td").length - 1));
   $("#ls_sgrader").attr("count", ($("#ls_sgrader").find("td").length - 1));
}



$("#tab_all_stu tr").each(function() {
  $this = $(this);

  $this.change(function() {
      $this = $(this);
      var typ = $this.find("input[name='role']:checked").val();
      console.log($this.find("input[name='role']")[0].parentNode.parentNode.parentNode.parentNode.cells[1].innerHTML);
      
      var name = $this.find("input[name='role']")[0].parentNode.parentNode.parentNode.parentNode.cells[0].textContent;
      
      var uin = $this.find("input[name='role']")[0].parentNode.parentNode.parentNode.parentNode.cells[1].innerHTML;
      remove_role(uin);
      var ok = add_role(typ, uin, name);
      if (!ok) {
        console.log("failed to add candidate ", typ, name, uin);
        $this.find("input[value='none']").prop("checked", true);
      }
    });
});

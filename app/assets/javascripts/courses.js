

var form_id = String("edit_course_" + $("#span_course_id").text());
var course_form = $("#" + form_id);
//console.log(course_form);

var add_role = function(typ, uin, name, id) {
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
  topls.append("<td name='" + id + "'><button type='button' class='btn " + color + "'>" + name + "</button></td>");
  topls.attr("count", count);
  return true;
}

var remove_role = function(id) {
  // console.log($("#ls_ta").find("td[name=" + uin + "]").remove());
  $("#ls_ta").find("td[name=" + id + "]").remove();
  $("#ls_grader").find("td[name=" + id + "]").remove();
  $("#ls_sgrader").find("td[name=" + id + "]").remove();
  
   $("#ls_ta").attr("count", ($("#ls_ta").find("td").length - 2));
   $("#ls_grader").attr("count", ($("#ls_grader").find("td").length - 2));
   $("#ls_sgrader").attr("count", ($("#ls_sgrader").find("td").length - 2));
}



$("#tab_all_stu tr").each(function() {
  $this = $(this);

  $this.change(function() {
      $this = $(this);
      var typ = $this.find("input[name='role']:checked").val();
    //  console.log($this.find("input[name='role']")[0].parentNode.parentNode.parentNode.parentNode.cells[1].innerHTML);
      
      var name = $this.find("input[name='role']")[0].parentNode.parentNode.parentNode.parentNode.cells[0].textContent;
      var uin = $this.find("input[name='role']")[0].parentNode.parentNode.parentNode.parentNode.cells[1].innerHTML;
      var id = $this.find("input[name='role']")[0].parentNode.parentNode.parentNode.parentNode.cells[2].innerHTML;

      remove_role(id); 
      if ("none" != typ) {
        var ok = add_role(typ, uin, name, id);
        if (!ok) {
          console.log("failed to add candidate ", typ, name, uin);
          $this.find("input[value='none']").prop("checked", true);
        }
      }
  
    });
});

  function fill_candidate_blanks(){
    for(i = 1; i <= 5;++i) {
      var sel = $("#course_ta_candidate_" + String(i));
      
  //    sel.find('option[selected]').remove();
  //    sel.find('selected').selectedIndex = -1;
//      document.getElementById("course_ta_candidate_" + String(i)).selectedIndex = -1;
      sel.find("option").prop("selected",false);
  //    sel.val([]);
    }
    for(i = 1; i <= 5;++i) {
      $("#course_grader_candidate_" + String(i)).find("option").prop("selected",false);
    }
    for(i = 1; i <= 5;++i) {
      $("#course_sgrader_candidate_" + String(i)).find("option").prop("selected",false);
    }
    
  {
    var tdls = $("#ls_ta").find("td");
    for(i = 2; i < tdls.length; ++i) {
      var id = tdls[i].attributes[0].nodeValue;
      $("#course_ta_candidate_" + String(i - 1)).val(id);
    }
  }
  {
    var tdls = $("#ls_grader").find("td");
    for(i = 2; i < tdls.length; ++i) {
      var id = tdls[i].attributes[0].nodeValue;
      $("#course_grader_candidate_" + String(i - 1)).val(id);
    }
  }
  {
    var tdls = $("#ls_sgrader").find("td");
    for(i = 2; i < tdls.length; ++i) {
      var id = tdls[i].attributes[0].nodeValue;
      $("#course_sgrader_candidate_" + String(i - 1)).val(id);
    }
  }
// return false;
}

function reset_ta_cand() {
    var tdls = $("#ls_ta")[0].cells;
    for(i = tdls.length - 1; i >= 2; i--) {
      tdls[i].remove();
    }
   $("#ls_ta").attr("count", 0);
}
function reset_grader_cand() {
  var tdls = $("#ls_grader")[0].cells;
    for(i = tdls.length - 1; i >= 2; i--) {
      tdls[i].remove();
    }
   $("#ls_grader").attr("count", 0);
}
function reset_sgrader_cand() {
    var tdls = $("#ls_sgrader")[0].cells;
    for(i = tdls.length - 1; i >= 2; i--) {
      tdls[i].remove();
    }
   $("#ls_sgrader").attr("count", 0);
}


course_form.submit(fill_candidate_blanks);
$(document).ready(function () {
    $("#formSociete").hide();
    $("#formDirigeant").hide();
});

$("#showform").change(function(){
    var selected = this.value;
    //Showing only selected form

    if (selected === "societe") {
        $("#formSociete").show();
        $("#formDirigeant").hide();
    }
    else if (selected === "dirigeant") {
        $("#formSociete").hide();
        $("#formDirigeant").show();
    }
    else{
        $("#formSociete").hide();
        $("#formDirigeant").hide();
    }
})
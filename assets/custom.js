$(document).ready(function () {
    var select = $("#showform");
    var ville = $("#societe_ville");
    var code = $("#societe_codePostal");

    getVillesByPostalCode(code.val(), ville);
    select.change(function(){
        var selected = this.value;
        //Showing only selected form
        if (selected === "societe") {
            $("#formSociete").show();
            $("#formDirigeant").hide();
        }
        else if (selected === "dirigeant") {
            $("#formSociete").hide();
            $("#formDirigeant").show();
        }else{
            $("#formSociete").hide();
            $("#formDirigeant").hide();
        }
    })

    code.change(function () {
        getVillesByPostalCode(code.val(), ville);
    });
});

function getVillesByPostalCode(code, villes) {
    $.get('/code/postal/' + code + '/villes').then((res) => {
        villes.empty();
        let $option;
        for (const resKey in res) {
            const item = res[resKey];
            $option = $('<option>');
            $option.attr('value', item.id);
            $option.html(item.nom);
            villes.append($option);
        }
    });
}
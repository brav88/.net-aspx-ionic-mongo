const modalContent = document.querySelector('#modalContent');

function showDetail(id) {
    window.location.href = 'detail.aspx?oiasdomejsof=' + id;
}
function registerNew(id) {
    window.location.href = 'registrar-prestamo.aspx?oiasdomejsof=' + id;
}
function registerPay(id, idpr) {
    window.location.href = 'registrar-abono.aspx?oiasdomejsof='+id+'&sfgergrs='+idpr;
}
function viewPays(id, idpr) {
    window.location.href = 'ver-abonos.aspx?oiasdomejsof=' + id + '&sfgergrs=' + idpr;
}
function showMessage(heading, body) {
    var modal = "<div class='modal fade' id='myModal'>"+
                    "<div class='modal-dialog modal-sm modal-dialog-centered' >"+
                         "<div class='modal-content'>"+
                             "<div class='modal-header'>"+
                                "<h2 class='modal-title'>"+heading+"</h2>"+
                                 //"<button type='button' class='close' data-dismiss='modal'>&times;</button>"+
                             "</div>"+
                             "<div class='modal-body'>"+
                                body+
                             "</div>"+
                             "<div class='modal-footer'>"+
                                 "<button type='button' class='btn btn-primary' data-dismiss='modal'>Ok</button>"+
                             "</div>"+
                         "</div>"+
                     "</div >"+
                "</div >";

    modalContent.innerHTML = modal;

    $("#myModal").modal('show');

    $(function () {
        $("#btnShow").click(function () {
            showModal();
        });
    });
}



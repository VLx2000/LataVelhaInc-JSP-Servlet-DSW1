setInterval(function filtro() {
    var filtrar = document.getElementById('filtro')
    var modelos = document.querySelectorAll('.modelo')
    var cards = document.querySelectorAll('.box')
    let cont = 0
    for (let i = 0; i < cards.length; i++) {
        if (filtrar.value == '') {
            cards[i].style = 'display: block;'
            cont = cards.length
        }
        else {
            /*console.log(filtrar.value.toUpperCase())
            console.log(modelos[i].textContent.toUpperCase())*/
            if (modelos[i].textContent.toUpperCase().includes(filtrar.value.toUpperCase())) {
                cards[i].style = 'display: block;'
                cont += 1
            }
            else {
                cards[i].style = 'display: none;'
            }
        }
    }
    document.getElementById('numero').textContent = cont + ' Carros'
}, 100)

function Clicavel(id) {
    window.location = "clientes/comprar?id=" + id;
    /*$(document).ready(function(){
        $(".box").click(function(){
            $.ajax({
                type:"GET",
                url:"ClasseServletAjax",
                data: {
                    pesquisar:$("#pesquisar").val()
                },
                success: function(respostaServidor){
                    $("#imprimirAjax")[0].innerHTML=respostaServidor;
                }
            });
        });*/
}
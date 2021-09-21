setInterval(function filtro() {
    var filtrar = document.getElementById('filtro')
    var modelos = document.querySelectorAll('.modelo')
    var cards = document.querySelectorAll('.box')
    for (let i = 0; i < cards.length; i++) {
        if (filtrar.value == '') {
            cards[i].style = 'display: block;'
        }
        else {
            /*console.log(filtrar.value.toUpperCase())
            console.log(modelos[i].textContent.toUpperCase())*/
            if (modelos[i].textContent.toUpperCase().includes(filtrar.value.toUpperCase())) {
                cards[i].style = 'display: block;'
            }
            else {
                cards[i].style = 'display: none;'
            }
        }
    }
}, 100)

function Clicavel(placa) {
    window.location = "https://google.com";
}
function msg_email() {
    
    var msg = document.getElementById('mensagem')
    var aceitar = document.getElementById('aceitar')
    var negar = document.getElementById('negar')
        aceitar.href += encodeURI(msg.value)
        negar.href += encodeURI(msg.value)
}
const loginForm = document.querySelector("#login-form");
loginForm.addEventListener('submit', evento => {
    evento.preventDefault();
    const formData = new FormData(loginForm);
                        
    var url = './../cgi-bin/login-usuario.pl';
    var promise = fetch(url, {
        method: "post",
        body: formData,
    });
    promise.then(response => response.text())
    .then(data => {
        if(data === "OK"){
            window.location.href = "./../clientes.html";
        }else{
            var element = document.getElementById('error-box');
            element.innerHTML = "<p>Error</p>";
            element.innerHTML = "<p>(!) Usuario no encontrado</p>";
        }
        console.log(data);
    }).catch(error => {
        console.log('Error:', error);
    });
})

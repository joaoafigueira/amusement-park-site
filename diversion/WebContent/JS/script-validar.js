

//VARIAVES GLOBAIS

var form_login = document.getElementById("form_login");
var email_login = document.getElementById("email_login");
var senha_login = document.getElementById("senha_login");
var form_cadastro = document.getElementById("form_cadastro");
var nome_usuario = document.getElementById("nome_usuario");
var idade_usuario = document.getElementById("idade_usuario");
var nome_cliente = document.getElementById("nome_cliente");
var email = document.getElementById("email");
var senha = document.getElementById("senha");
var phone_usuario = document.getElementById("phone_usuario");
 var form_editar = document.getElementById('form_editar');

//VALIDAR LOGIN 

function validarLogin() {

	if (email_login.value === "") {	
		Swal.fire({
			icon: 'info',
			title: 'Oops...',
			text: 'Preencha o campo  email',

		})
		email_login.focus();
		return false;
	} else if (senha_login.value === "") {
		Swal.fire({
			icon: 'info',
			title: 'Oops...',
			text: 'Preencha o campo  senha',
		})
		senha_login.focus();
		return false;
	}
}





function validarCadastroEditar(){

	if (nome_usuario.value === "") {
			Swal.fire({
			icon: 'info',
			title: 'Oops...',
			text: 'Preencha o campo usuário',

		})
		nome_usuario.focus();
		return false;
	} else if (idade_usuario.value === "") {
			Swal.fire({
			icon: 'info',
			title: 'Oops...',
			text: 'Preencha o campo idade',

		})
		idade_usuario.focus();
		return false;
	} else if (nome_cliente.value === "") {
			Swal.fire({
			icon: 'info',
			title: 'Oops...',
			text: 'Preencha o campo nome',

		})
		nome_cliente.focus();
		return false;
	} else if (email.value === "") {
			Swal.fire({
			icon: 'info',
			title: 'Oops...',
			text: 'Preencha o campo email',

		})
		email.focus();
		return false;
	} else if (senha.value === "") {
			Swal.fire({
			icon: 'info',
			title: 'Oops...',
			text: 'Preencha o campo senha',

		})
		senha.focus();
		return false;
	}
	
	

}
   
//CAPTURANDO O EVENTO DE SUBMIT PARA QUE 
//POSSA SER POSSIVEL EXIBIR O SWEETALERT
//APÓS A EDIÇÃO SER CONCLUÍDA
 form_editar.addEventListener('submit',function(){
	      Swal.fire({
          position:'center',
          icon: 'success',
          title: 'Editado com sucesso',
          showConfirmButton: false,
          allowOutsideClick: false
        
        })   
		
})   






















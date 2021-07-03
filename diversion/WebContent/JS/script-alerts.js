

function alertIng() {

	Swal.fire({
		position: 'center',
		icon: 'info',
		title: 'Para a compra do ingresso você deve fazer login, se  você não possuir login deve-se cadastrar'
	})

}

function confirmar(IdClienteAdmin) {
       
	Swal.fire({
		title: 'Você tem certeza?',
		text: "Não sera possivel reverter isso!",
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: 'Deletar!'
	}).then((result) => {
		if (result.isConfirmed) {
			window.location.href = "DeletarCliente?IdClienteAdmin="+IdClienteAdmin
			Swal.fire({
				position: 'center',
				icon: 'success',
				title: 'Cliente excluído com sucesso!',
				showConfirmButton: false,
				allowOutsideClick: false


			})
		}
	})

}
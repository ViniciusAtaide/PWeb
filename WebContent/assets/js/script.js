$(document).ready(function() {	
	// CHECAGEM DE SENHA

	$("#pass").on('keyup',	function() {
		if ($("#pass").val() != $("#passcheck").val() || $("#pass").val() == "") {
			$("#error-pass").css("display","block");
			$("#acert-pass").css("display","none");
			} else {
				$("#error-pass").css("display","none");
				$("#acert-pass").css("display","block");
			}
	});
	$("#passcheck").on('keyup',	function() {
		if ($("#pass").val() != $("#passcheck").val() || $("#passcheck").val() == "") {
			$("#error-pass").css("display","block");		
			$("#acert-pass").css("display","none");
			} else {
				$("#error-pass").css("display","none");
				$("#acert-pass").css("display","block");
			}
	});
	$("#cadastrouser").submit(function() {
		if ($("#pass").val() != $("#passcheck").val() || $("#passcheck").val() == "" || $("#login").val() == "") {
			$("#error-submit").html("Preencha todos os campos corretamente.");
			return false;
		}

		return true;
	});	
	
	/////////////////////////////////////////////////////////////////////////
	// CHECAGEM DE CAMPOS MUSICAIS
	
	
	$("#cadastromusica").submit(function() {
		if ($("#tit").val() == "" || $("#est").val() == "" || $("#alb").val() == "" || $("#alb").val() == "" || $("#aut").val() == "") {
			$("#error-submit").html("Preencha todos os campos!");
			$("#error-submit").css("display","block");
			return false;
		}
		if ($("#tit").val().length < 3 && $("#est").val().length <3 && $("#alb").val().length <3 && $("#alb").val().length <3 && $("#aut").val().length <3) {
			$("error-submit").html("Limite de caracteres abaixo do minimo");
			$("#error-submit").css("display","block");
			return false;
		}
		return true;
	});	
});
// Função mista para ambos os campos de arquivo de música e foto do usuario utilizando html5 files
function abreId3(input) {
	  var reader = new FileReader();

	  $("#musica").val(input.files[0].name);
  	  $("#tit").removeAttr('disabled');
  	  $("#aut").removeAttr('disabled');
  	  $("#alb").removeAttr('disabled');
  	  $("#est").removeAttr('disabled');

	  reader.onload = function(e) {
		    var dv = new jDataView(this.result);
	
		    if (dv.getString(3, dv.byteLength - 128) == 'TAG') {
	      		$("#tit").val(dv.getString(30, dv.tell()));
	      		$("#aut").val(dv.getString(30, dv.tell()));
	      		$("#alb").val(dv.getString(30, dv.tell()));
		    } else {
		    	$("#erro_musica").html("Formato id3 não suportado.");
		    }
	  };

	  reader.readAsArrayBuffer(input.files[0]);
}

// função html 5 para pegar informações de imagem
function tocaMusica(input) {
	
		
}
//
function abreURL(input) {	
	if (input.files && input.files[0]) {
		var f = input.files[0];	      	
		var reader = new FileReader();
		reader.onload = (function(arq) { 
			return function(e) {
				var src = e.target.result;
	      		var nome = arq.name;
	      		$('#foto').attr('src', src);
	      		$('#file-falso').val(nome);		      		     
			};
		})(f);
		reader.readAsDataURL(f);		
				
		return false;
	}		
}

// Postagem 

function postarMusica() {
	
}



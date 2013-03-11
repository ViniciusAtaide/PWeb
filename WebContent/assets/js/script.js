$(document).ready(function() {
	
	
	// CHECAGEM DE SENHA

	if ($("#pass").val() != $("#passcheck").val() || $("#pass").val() == "") {
		$("#error-pass").html("Verificar senha.");
		$("#acert-pass").html("");
	} else {
		$("#error-pass").html("");
		$("#acert-pass").html("Correto");
	}
	$("#pass").on('keyup',	function() {
		if ($("#pass").val() != $("#passcheck").val() || $("#pass").val() == "") {
			$("#error-pass").html("Verificar senha.");
			$("#acert-pass").html("");
			} else {
				$("#error-pass").html("");
				$("#acert-pass").html("Correto");
			}
	});
	$("#passcheck").on('keyup',	function() {
		if ($("#pass").val() != $("#passcheck").val() || $("#passcheck").val() == "") {
			$("#error-pass").html("Verificar senha.");
			$("#acert-pass").html("");
			} else {
				$("#error-pass").html("");
				$("#acert-pass").html("Correto");
			}
	});
	$("#cadastrouser").submit(function() {
		if ($("#pass").val() != $("#passcheck").val()) {
			$("#error-submit").html("Corrija todos os erros!");
			return false;
		}
		return true;
	});
	
	
	//////////////////////////////////////////////////////////////////////////
	// Função de troca de botões
	
	
	$(".play").on('click',function() {
		$(".playdiv").css('display','none');
		$(".stopdiv").css('display','inline');
	});
	$(".stop").on('click', function() {
		$(".playdiv").css('display','inline');
		$(".stopdiv").css('display','none');
	});
	
	
	/////////////////////////////////////////////////////////////////////////
	// CHECAGEM DE CAMPOS MUSICAIS
	
	
	$("#cadastromusica").submit(function() {
		if ($("#tit").val() == "" && $("#est").val() == "" && $("#alb").val() == "" && $("#alb").val() == "" && $("#aut").val() == "") {
			$("#error-submit").html("Preencha todos os campos!");
			return false;
		}
		if ($("#tit").val().length < 3 && $("#est").val().length <3 && $("#alb").val().length <3 && $("#alb").val().length <3 && $("#aut").val().length <3) {
			$("error-submit").html("Limite de caracteres abaixo do minimo");
			return false;
		}
		return true;
	});	
});
// Função mista para ambos os campos de arquivo de música e foto do usuario utilizando html5 files
function abreId3(input) {
	  var reader = new FileReader();

	  reader.onload = function(e) {
		    var dv = new jDataView(this.result);
	
		    if (dv.getString(3, dv.byteLength - 128) == 'TAG') {
		    	$("#tit").removeAttr('disabled');
	      		$("#aut").removeAttr('disabled');
	      		$("#alb").removeAttr('disabled');
	      		$("#est").removeAttr('disabled');
	      		$("#tit").val(dv.getString(30, dv.tell()));
	      		$("#aut").val(dv.getString(30, dv.tell()));
	      		$("#alb").val(dv.getString(30, dv.tell()));
	      		$("#musica").val(input.files[0].name);	
		    } else {
		    	$("#erro_musica").html("Formato id3 não suportado.");
		    }
	  };

	  reader.readAsArrayBuffer(input.files[0]);
}
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

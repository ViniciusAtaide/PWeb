$(document).ready(function() {
	// CHECAGEM DE SENHAS
	
	$("#stop").on('click', function() {
		$("#playdiv").css('display','inline');
		$("#stopdiv").css('display','none');
	});
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
	$("#play").on('click',function() {
		$("#playdiv").css('display','none');
		$("#stopdiv").css('display','inline');
	});
	// CHECAGEM DE CAMPOS MUSICAIS
	$("#cadastromusica").submit(function() {
		if ($("#tit").val() == "" && $("#est").val() == "" && $("#alb").val() == "" && $("#alb").val() == "" && $("#aut").val() == "") {
			$("#error-submit").html("Preencha todos os campos!");
			return false;
		}
		return true;
	});
	
});
function abreURL(input) {	
	if (input.files && input.files[0]) {
		var f = input.files[0];	      	
		var reader = new FileReader();
		reader.onload = (function(arq) { 
			return function(e) {
				var src = e.target.result;
	      		var nome = arq.name;      		
				if (!f.type.match('image.*')) {	
		      		$('#musica').val(nome);
		      		$("#tit").removeAttr('disabled');
		      		$("#aut").removeAttr('disabled');
		      		$("#alb").removeAttr('disabled');
		      	} else {
		      		$('#foto').attr('src', src);
		      		$('#file-falso').val(nome);		      	
		      	}				
			};
		})(f);
		reader.readAsDataURL(f);		
				
		return false;
	}		
}

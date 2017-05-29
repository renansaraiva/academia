function jm_integermask(t) {
	var donepatt = /^(\d*)$/;

	if (!t.value.match(donepatt)) {
		t.value = t.value.replace(/[\D]/gi, '');
	}
}

function jm_currencymask(t) {
	var patt = /(\d*)\,{1}(\d{0,2})/;
	var donepatt = /^(\d*)\,{1}(\d{2})$/;
	var str = t.value;
	var result;
	if (!str.match(donepatt)) {
		result = str.match(patt);
		if (result != null) {
			t.value = t.value.replace(/[^\d]/gi, '');
			str = result[1] + ',' + result[2];
			t.value = str;
		}
		else {
			if (t.value.match(/[^\d]/gi)) {
				t.value = t.value.replace(/[^\d]/gi, '');
			}
		}
	}
}

function jm_datemask(t) {
	var donepatt = /^(\d{2})\/(\d{2})\/(\d{4})$/;
	var patt = /(\d{2}).*(\d{2}).*(\d{4})/;
	var str = t.value;
	if (!str.match(donepatt)) {
		result = str.match(patt);
		if (result != null) {
			t.value = t.value.replace(/[^\d]/gi, '');
			str = result[1] + '/' + result[2] + '/' + result[3];
			t.value = str;
		} else {
			if (t.value.match(/[^\d]/gi))
				t.value = t.value.replace(/[^\d]/gi, '');
		} 
	} 
}

function checkCR(evt) {
	var evt = (evt) ? evt : ((event) ? event : null);
	var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null);

	if
		(
			node.type != "submit" &&
			node.type != "textarea"
		) {
		if (evt.keyCode == 13) { return false; }
	}
	if (node.type == "select-one") {
		if (evt.keyCode == 8) { return false; }
	}

	return true;
}

document.onkeypress = checkCR;
function addActiveLinks(txt)
{
	txt = txt.replace(/(script|about|applet|activex|chrome):/ig, "$1:"); 
	txt = ' ' + txt; 
	txt = txt.replace(/(^|[\n ])([\w]+?:\/\/[\w\#$%&~/.\-;:=,?@\[\]+]*)/ig, "$1<a href=\"$2\" target=\"_blank\">$2</a>"); 
	txt = txt.replace(/(^|[\n ])((www|ftp)\.[\w\#$%&~/.\-;:=,?@\[\]+]*)/ig, "$1<a href=\"http://$2\" target=\"_blank\">$2</a>"); 
	txt = txt.replace(/(^|[\n ])([a-z0-9&\-_.]+?)@([\w\-]+\.([\w\-\.]+\.)*[\w]+)/ig, "$1<a href=\"mailto:$2@$3\">$2@$3</a>"); 
	txt = txt.substr( 1); 
	return txt;
}

function addActivePeople(txt)
{
	txt = txt.replace(/\@\[([\s\w@\.]+)\]\((\w+):(\w+)\)/ig, "<a href='/$3'><b>@$1</b></a>", txt);	
	return txt;
}

/*function addActiveLinks(txt)
{
	//return txt;
	var exp = /(\b(https?|ftp|file):\/\/[-A-Z0-9+&@#\/%?=~_|!:,.;]*[-A-Z0-9+&@#\/%=~_|])/ig;
  	return txt.replace(exp,"<a href='$1'>$1</a>"); 
}*/

function nl2br(txt)
{
	txt.replace(/\n/g, "<br />");
	return txt;
}


function str_repeat(i, m) {
	for (var o = []; m > 0; o[--m] = i);
	return o.join('');
}

function sprintf() {
	var i = 0, a, f = arguments[i++], o = [], m, p, c, x, s = '';
	while (f) {
		if (m = /^[^\x25]+/.exec(f)) {
			o.push(m[0]);
		}
		else if (m = /^\x25{2}/.exec(f)) {
			o.push('%');
		}
		else if (m = /^\x25(?:(\d+)\$)?(\+)?(0|'[^$])?(-)?(\d+)?(?:\.(\d+))?([b-fosuxX])/.exec(f)) {
			if (((a = arguments[m[1] || i++]) == null) || (a == undefined)) {
				throw('Too few arguments.');
			}
			if (/[^s]/.test(m[7]) && (typeof(a) != 'number')) {
				throw('Expecting number but found ' + typeof(a));
			}
			switch (m[7]) {
				case 'b': a = a.toString(2); break;
				case 'c': a = String.fromCharCode(a); break;
				case 'd': a = parseInt(a); break;
				case 'e': a = m[6] ? a.toExponential(m[6]) : a.toExponential(); break;
				case 'f': a = m[6] ? parseFloat(a).toFixed(m[6]) : parseFloat(a); break;
				case 'o': a = a.toString(8); break;
				case 's': a = ((a = String(a)) && m[6] ? a.substring(0, m[6]) : a); break;
				case 'u': a = Math.abs(a); break;
				case 'x': a = a.toString(16); break;
				case 'X': a = a.toString(16).toUpperCase(); break;
			}
			a = (/[def]/.test(m[7]) && m[2] && a >= 0 ? '+'+ a : a);
			c = m[3] ? m[3] == '0' ? '0' : m[3].charAt(1) : ' ';
			x = m[5] - String(a).length - s.length;
			p = m[5] ? str_repeat(c, x) : '';
			o.push(s + (m[4] ? a + p : p + a));
		}
		else {
			throw('Huh ?!');
		}
		f = f.substring(m[0].length);
	}
	return o.join('');
}


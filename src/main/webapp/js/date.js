			Date.prototype.Format = function (fmt) { // author: meizz
	                var o = {
	                    "M+": this.getMonth() + 1, // 月份
	                    "d+": this.getDate(), // 日
	                    "h+": this.getHours(), // 小时
	                    "m+": this.getMinutes(), // 分
	                    "s+": this.getSeconds(), // 秒
	                    "q+": Math.floor((this.getMonth() + 3) / 3), // season
	                    "S": this.getMilliseconds() // 毫秒
	                };
	                if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	                for (var k in o)
	                    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
	                return fmt;
	            };
	            var formatJson = function(json, options) {
	                if(json == '') return '';
	                var reg = null,
	                    formatted = '',
	                    pad = 0,
	                    PADDING = '    '; // one can also use '\t' or a
											// different number of spaces

	                // optional settings
	                options = options || {};
	                // remove newline where '{' or '[' follows ':'
	                options.newlineAfterColonIfBeforeBraceOrBracket = (options.newlineAfterColonIfBeforeBraceOrBracket === true) ? true : false;
	                // use a space after a colon
	                options.spaceAfterColon = (options.spaceAfterColon === false) ? false : true;

	                // begin formatting...
	                if (typeof json !== 'string') {
	                    // make sure we start with the JSON as a string
	                    json = JSON.stringify(json);
	                } else {
	                    // is already a string, so parse and re-stringify in
						// order to remove extra whitespace
	                    json = JSON.parse(json);
	                    json = JSON.stringify(json);
	                }

	                // add newline before and after curly braces
	                reg = /([\{\}])/g;
	                json = json.replace(reg, '\r\n$1\r\n');

	                // add newline before and after square brackets
	                reg = /([\[\]])/g;
	                json = json.replace(reg, '\r\n$1\r\n');

	                // add newline after comma
	                reg = /(\,)/g;
	                json = json.replace(reg, '$1\r\n');

	                // remove multiple newlines
	                reg = /(\r\n\r\n)/g;
	                json = json.replace(reg, '\r\n');

	                // remove newlines before commas
	                reg = /\r\n\,/g;
	                json = json.replace(reg, ',');

	                // optional formatting...
	                if (!options.newlineAfterColonIfBeforeBraceOrBracket) {
	                    reg = /\:\r\n\{/g;
	                    json = json.replace(reg, ':{');
	                    reg = /\:\r\n\[/g;
	                    json = json.replace(reg, ':[');
	                }
	                if (options.spaceAfterColon) {
	                    reg = /\:/g;
	                    json = json.replace(reg, ': ');
	                }

	                $.each(json.split('\r\n'), function(index, node) {
	                    var i = 0,
	                        indent = 0,
	                        padding = '';

	                    if (node.match(/\{$/) || node.match(/\[$/)) {
	                        indent = 1;
	                    } else if (node.match(/\}/) || node.match(/\]/)) {
	                        if (pad !== 0) {
	                            pad -= 1;
	                        }
	                    } else {
	                        indent = 0;
	                    }

	                    for (i = 0; i < pad; i++) {
	                        padding += PADDING;
	                    }

	                    formatted += padding + node + '\r\n';
	                    pad += indent;
	                });
	                return formatted;
	            };
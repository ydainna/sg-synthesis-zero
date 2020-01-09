let app = (() => {
	let endPoint;
	return {
		modules: {}
	}
})();

app.modules = (() => {
	return {
		init: (endPoint) => {
			app.endPoint = endPoint;

			app.modules.builder.display('login_api_data_client.json');
		},
		query: (url, type) => {
			let pr = $.ajax((app.endPoint + url), {
				type: type,
				dataType: "json",
				context: this,
				xhrFields: {
					withCredentials: true
				}
			});
			pr.fail((jqXHR, status, error) => {
				alert('Loading data.json error !')
			});
			return pr;
		}
	}
})();

app.modules.builder = (() => {
	return {
		display: (file) => {
			var pr = app.modules.query(file, 'GET');
			pr.done((data) => {
				app.modules.builder.buildTable({			
					header: {
						date: 'Date',
						login: 'Nom de compte',
						pass: 'Mot de passe',
						serverIP: 'Serveur IP',
						serverID: 'Serveur ID',
						serverName: 'Serveur Name',
						LoginPort: 'Login port',
						lang: 'HTTP lang'
					},
					data: data,
					container: '#data'
				});
			});
		},
		buildTable: (params) => {
			var thead = document.createElement('thead')
			var tr = document.createElement('tr')
			$.each(params.header, (k, v) => {
				var th = document.createElement('th')
				$(th).text(v)
				$(th).attr('style', 'width: calc(100% / ' + parseInt(Object.keys(params.header).length) + ');')
				$(tr).append(th)
			})
			$(thead).append(tr)
			$(params.container).append(thead)

			var tbody = document.createElement('tbody')

			$.each(params.data.data, (k, v) => {
				var tr = document.createElement('tr')
				$.each(params.header, (e, f) => {
					var td = document.createElement('td')
					$(td).text(v[e])
					$(td).attr('style', 'width: calc(100% / ' + parseInt(Object.keys(params.header).length) + ');')
					$(tr).append(td)
				})

				$(tbody).append(tr)
			})
			$(params.container).append(tbody)
		}
	}
})();
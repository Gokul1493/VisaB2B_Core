function fn() {
	var env = karate.env; // get system property 'karate.env'
	karate.log('karate.env system property was:', env);
	karate.log('Visa B2B Automation Running')
	karate.configure('connectTimeout', 40000);
	karate.configure('readTimeout', 40000);
	
	// Retry mechanism for unstable requests: Retry up to 3 times with 2000ms delay
	karate.configure('retry', { count: 3, interval: 2000 });


	var jutil = Java.type('visab2b.Drivers.Addons')

	var mh = function(request) {
		if (typeof user !== 'undefined') {
			karate.log('User is defined.execute the function.');
			karate.log(user);
			var sg = jutil.sign(request.bodyAsString, user.pk);
			var hdrs = {
				Authorization: 'Basic ' + jutil.btoa(user.user + ':' + user.password),
				Signature: 'keyId=' + user.keyId + ',algorithm=ecdsa-sha256,signature=' + sg
			}
			return hdrs;
		} else {
			karate.log('User is not defined. Cannot execute the function.');
			return null;
		}
	}
	karate.configure('headers', mh);

	var testData = read('classpath:visab2b/TestData/Config.json')
	karate.log(testData)
	if (!env) {
		env = 'VISA';
	}
	var config = {

		Jutil: Java.type('visab2b.Drivers.Addons'),

		signs: function(req, pk, keyId) {
			var sg = Jutil.sign(JSON.stringify(req), pk);
			var Signature = 'keyId=' + keyId + ',algorithm=ecdsa-sha256,signature=' + sg
			return Signature
		},
		signs: function(req, user) {
			var signature = jutil.sign(JSON.stringify(req.params.payload), user.pk);
			req.params.Api.Signature = signature
			return req
		},
		signsreq: function(req, user) {
			var payload_string = JSON.stringify(req.params.Payload)
			var slash_add = payload_string.replace(/\//g, '\\/');
			console.log("*****:",user.pk)
			var signature = jutil.sign(slash_add, user.pk);
			req.params.Payload = JSON.parse(JSON.stringify(req.params.Payload))
			req.params.Api.Signature = signature
			return req
		},
		signscorp: function(req, user) {
			var payload_string = JSON.stringify(req.params.payload)
			var slash_add = payload_string.replace(/\//g, '\\/');
			console.log("*****:",user.pk)
			var signature = jutil.sign(slash_add, user.pk);
			req.params.payload = JSON.parse(JSON.stringify(req.params.payload))
			req.params.api.signature = signature
			return req
		}
	}
	if (env == 'VISA') {
		config.QaUrl = testData.Visa.URL;		
			}
	return config;
}
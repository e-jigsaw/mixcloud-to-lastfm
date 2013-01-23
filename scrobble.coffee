$(document).ready ->
	ROOT_URL = "http://ws.audioscrobbler.com/2.0/"
	$(".tracklistcell").each ->
		$(this).append "<button class='lastfm-scrobble'>scrobble</button>"
		$(".lastfm-scrobble:last").on "click", (e)->
			trackname = $(e.target.parentNode).find(".tracklisttrackname").text()
			artistname = $(e.target.parentNode).find(".tracklistartistname").text()
			timestamp = new Date().getTime()
			$.get ROOT_URL,
				method: "auth.gettoken"
				api_key: LASTFM_API_KEY
				api_sig: LASTFM_API_SECRET
				format: "json"
			, (res)->
				token = res.token
				$.get ROOT_URL,
					method: "auth.getsession"
					api_key: LASTFM_API_KEY
					api_sig: CybozuLabs.MD5.calc "api_key#{LASTFM_API_KEY}methodauth.getSessiontoken#{token}hoge"
					token: token
					format: "json"
				, (res)->
					console.log res # error
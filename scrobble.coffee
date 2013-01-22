$(document).ready ->
	$(".tracklistcell").each ->
		$(this).append "<button class='lastfm-scrobble'>scrobble</button>"
		$(".lastfm-scrobble:last").on "click", (e)->
			self = this
			trackname = $(e.target.parentNode).find(".tracklisttrackname").text()
			artistname = $(e.target.parentNode).find(".tracklistartistname").text()
			$(self).attr "disabled", true
			$(self).text "Progress..."
			$.get "http://universalscrobbler.invitationstation.org/scrobble.php"
				submissionType: "track"
				username: USERNAME
				password: PASSWORD
				artist: artistname
				track: trackname
			, (data)->
				if data.success is 1
					$(self).text "Success!"
				else
					$(self).text "Try Again"
					console.log data
			
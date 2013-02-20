$(document).ready ->
	$(".tracklistcell").each ->
		$(this).append "<button class='lastfm-scrobble'>scrobble</button>"
		$(".lastfm-scrobble:last").on "click", (e)->
			button = $(this)
			trackname = $(e.target.parentNode).find(".tracklisttrackname").text()
			artistname = $(e.target.parentNode).find(".tracklistartistname").text()
			button.attr "disabled", true
			button.text "Progress..."
			$.get "http://universalscrobbler.invitationstation.org/scrobble.php"
				submissionType: "track"
				username: USERNAME
				password: PASSWORD
				artist: artistname
				track: trackname
			, (data)->
				if data.success is 1
					button.text "Success!"
				else
					button.text "Try Again"
					button.attr "disabled", false
			
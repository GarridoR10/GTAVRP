var visable = false;

$(function () {
	window.addEventListener('message', function (event) {
		switch (event.data.action) {
			
			case 'toggle':
				if (visable) {
					$('#wrap').fadeOut();
				} else {
					$('#wrap').fadeIn();
				}

				visable = !visable;
				break;

			case 'close':
				$('#wrap').fadeOut();
				visable = false;
				break;

			case 'toggleID':
				if (event.data.state == true) {
					$('.sid').show();
					$('.pid').show();
				} else {
					$('.sid').hide();
					$('.pid').hide();
				}
				break;

			case 'toggleJob':
				if(event.data.state == true) {
					$('.sjob').show();
				} else {
					$('.sjob').hide();
				}
				break;
				
			case 'scroll':
				if(event.data.scroll == "up") {
					var pos = $("#playerwrapper").scrollTop()
					$("#playerwrapper").scrollTop(pos - 140);
				} else if(event.data.scroll == "down") {
					var pos = $("#playerwrapper").scrollTop()
					$("#playerwrapper").scrollTop(pos + 140);
				}
				break;
			
			case 'updatePlayerJobs':
				var jobs = event.data.jobs;
				$('#player_count').html(jobs.player_count);
				$('#ems').html(jobs.ems);
				$('#police').html(jobs.police);
				$('#sheriff').html(jobs.sheriff);
				$('#taxi').html(jobs.taxi);
				$('#mechanic').html(jobs.mechanic);
				$('#cardealer').html(jobs.cardealer);
				$('#estate').html(jobs.estate);
				break;

			case 'updatePlayerList':
				$('#playerwrapper').empty();
				$('#playerwrapper').append(event.data.players);
				applyPingColor();
				sortPlayerList();
				break;

			case 'updatePing':
				updatePing(event.data.players);
				applyPingColor();
				break;

			case 'updateServerInfo':
				if (event.data.maxPlayers) {
					$('#max_players').html(event.data.maxPlayers);
				}
				break;

			default:
				console.log('esx_scoreboard: unknown action!');
				break;
		}
	}, false);
});

function applyPingColor() {
	$('#playerlist tr').each(function () {
		$(this).find('.ping').each(function () {
			var ping = $(this).html();
			var color = '#00e68a';

			if (ping > 50 && ping < 80) {
				color = '#ff8000';
			} else if (ping >= 80) {
				color = '#ff0000';
			}

			$(this).css('color', color);
			$(this).html(ping + "<span style='color:#ffffff;'> ms</span>");
		});

	});
}

function updatePing(players) {
	jQuery.each(players, function (i, v) {
		if (v != null) {
			$('#playerlist tr:not(.heading)').each(function () {
				$(this).find('.pid:contains(' + v.id + ')').each(function () {
					$(this).parent().find('.ping').html(v.ping);
				});
			});
		}
	});
}

function sortPlayerList() {
	var table = $('#playerlist'),
		rows = $('tr:not(.heading)', table);

	rows.sort(function(a, b) {
		var keyA = $('td', a).eq(1).html();
		var keyB = $('td', b).eq(1).html();

		return (keyA - keyB);
	});

	rows.each(function(index, row) {
		table.append(row);
	});
}

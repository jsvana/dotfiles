S.cfga({
  'defaultToCurrentScreen': true,
  'secondsBetweenRepeat': 0.1,
  'checkDefaultsOnLoad': true,
  'focusCheckWidthMax': 3000,
  'orderScreensLeftToRight': true
});

var main = S.lay('main', {
	'Firefox': {
		'operations': [
			S.op('move', {
				'x': 'screenOriginX',
				'y': 'screenOriginY',
				'width': 'screenSizeX',
				'height': 'screenSizeY * 2/3'
			})
		],
		'repeat': true
	},
	'iTerm': {
		'operations': [
			S.op('move', {
				'x': 'screenOriginX',
				'y': 'screenSizeY - screenSizeY / 3',
				'width': 'screenSizeX',
				'height': 'screenSizeY / 3'
			})
		],
		'repeat': true
	}
});

S.def(1, main);

S.bnda({
	'esc:cmd': S.op('hint'),
	'esc:ctrl': S.op('grid')
});

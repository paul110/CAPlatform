Sketch.create! links: [{from: '1234', to: '5678', logic: 'toggle'}], boards: [{mac: '1234', centre: {x: 120, y: 120}, width: 40, height: 40}, {mac: '5678', centre: {x: 240, y: 120}, width: 40, height: 40}]
Board.create! mac: "1234"
Board.create! mac: "5678"

ExternalDatum.create! source_type: 0, name: 'NY Times', url: '', data: [{href: '', title: 'First headline'}]

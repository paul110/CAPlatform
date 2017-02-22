Board.create! mac: "1234"
Board.create! mac: "5678"

ExternalDatum.create! source_type: 0, name: 'NY Times', url: '', data: [{href: '', title: 'First headline'}]
Board.create! mac: "MacOS|Chrome|56.0.2924.87"

Sketch.create! links: [{from: '1234', to: '5678', logic: 'toggle'}],
  boards: [{mac: '1234', centre: {x: 120, y: 120}, width: 40, height: 40},
    {mac: '5678', centre: {x: 240, y: 120}, width: 40, height: 40}]
Sketch.create! links: [{to: "MacOS|Chrome|56.0.2924.87", from: "1234", logic: "link_opener"}],
  boards: [{mac: "1234", width: 40, centre: {x: 224.5,y: 85},height: 40},
    {mac: "MacOS|Chrome|56.0.2924.87",width: 40, centre: {x: 383.5,y: 84}, height: 40}]

SELECT lastname, firstname, tag, open_weekends
 FROM drivers, vehicles, locations
 WHERE drivers.location = vehicles.location
 AND vehicles.location = locations.location
 AND locations.open_weekends = 'Yes'

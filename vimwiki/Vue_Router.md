

$route.path is equal to the absolute path; e.g. /people
$route.params contains the key/value pairs of your dynamic sections; e.g. { personId: 5 }
$route.query contains the key/value pairs of your query string; 
e.g. /people?sortBy=names would return { sortBy : lastName }
$route.router returns the vue-router instance
$route.matched returns route configuration objects for every matched segment in the current route
$route.name returns the name, if it has one, of the current route

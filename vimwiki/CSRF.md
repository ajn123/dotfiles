
CSRF (Cross-Site Request Forgery) is a method of attack that 
“works by including malicious code or a link in a page that accesses a web application the user 
is believed to have authenticated. If the session for that web application has not 
timed out, an attacker may execute unauthorized commands.” (Cross-Site Request Forgery (CSRF))


If you are submitting data via jquery or without the standard form remember to 
include or delete the CSFR token that is in rails with
this in your controllers:


```javascript
protect_from_forgery with: :null_session



var token = $('meta[name=csrf-token]').attr('content');

// javascript
var token = document.getElementsByName('csrf-token')[0].content


var token = $('meta[name=csrf-token]').attr('content');
var data = { post: { title: "some title", content: "Lorem ipsum dolor" } }

$.ajax({
  url: '/api/v1/posts',
  type: 'POST',
  headers: {
    'Content-Type': 'application/json',
    'X-CSRF-Token': token) 
  },
  data: data,
  success: function(response) {
    doSomething(response);
  }
});

var token = $('meta[name=csrf-token]').attr('content');
var data = { post: { title: "some title", content: "Lorem ipsum dolor" } }

fetch('/api/v1/posts', {
  method: 'POST',
  body: JSON.stringify(data),
  headers: {
    'Content-Type': 'application/json',
    'X-CSRF-Token': token
  },
  credentials: 'same-origin'
}).then(function(response) {
  return response.json();
}).then(function(data) {
  console.log(data);
});

```

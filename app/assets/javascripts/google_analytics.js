/*global gtag*/

document.addEventListener('turbolinks:load', function(event) {
  if (typeof gtag === 'function') {
    gtag('config', 'UA-143402469-1', {
      'page_location': event.data.url
    })
  }
})
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require turbolinks
//= require_tree .
//= require marked
//= require highlight/highlight.pack
//= require codemirror
//= require codemirror/modes/xml
//= require codemirror/modes/markdown
//= require codemirror/addons/mode/overlay
//= require codemirror/modes/gfm
//= require codemirror/modes/javascript
//= require js-deflate/rawdeflate
//= require js-deflate/rawinflate
//= require bootstrap-sprockets

<!-- marked -->
$(document).ready(function(){
  var blocks = document.querySelectorAll('.se_text');
  Array.prototype.forEach.call(blocks, function(b){
    b.innerHTML = marked(b.innerHTML);
  });
});

<!-- highlight -->
$(document).ready(function(){
  var blocks = document.querySelectorAll("pre code");
  Array.prototype.forEach.call(blocks, function(b){
    hljs.highlightBlock(b);
  });
});

<!--google universal analytics-->
(function(i,s,o,g,r,a,m){i["GoogleAnalyticsObject"]=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,"script","//www.google-analytics.com/analytics.js","ga");
ga("create", "<%= Settings.google_analytics_key %>", "auto");
$(document).ready(function(){
  ga("send", "pageview", window.location.pathname);
});

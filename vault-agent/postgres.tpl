{{ with secret "postgres/creds/nginx" -}}
<html><head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
</head><body>
<div class="alert alert-success" role="alert">
<h5 class="alert-heading">Secret path &#58; postgres/creds/nginx, Policy &#58; nginx</h5>
    <ul><li><strong>Connection String</strong> &#58; postgresql://{{ .Data.username }}:{{ .Data.password }}@localhost:15432/products</li>
    <li><strong>host:port</strong> &#58; localhost:[15432,25432,35432]</li>
    <li><strong>username</strong> &#58; {{ .Data.username }}</li>
    <li><strong>password</strong> &#58; {{ .Data.password }}</li></ul>
<hr/>
<p class="mb-0"><a href="kv.html">go to KV info</a></p>
</div> </body></html>
{{- end }}
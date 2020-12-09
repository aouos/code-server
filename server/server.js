/*
 * @Author: aouos 
 * @Date: 2020-11-29 16:29:38 
 * @Last Modified by: aouos
 * @Last Modified time: 2020-12-09 17:25:35
 */
const http = require('http')
const fs = require('fs')
const httpPort = 1314

http.createServer((req, res) => {
  console.log(req.url);
  let file = req.url;
  if (req.url === '/') {
    file = '/index.html'
  }
  try {
    const data = fs.readFileSync('/home/www' + file)
    res.writeHead(200, {
      'Content-Type': 'text/html; charset=utf-8'
    })
    res.end(data)
  } catch (e) {
    console.log(e);
  }
}).listen(httpPort, () => {
  console.log('Server listening on: http://localhost:%s', httpPort)
})
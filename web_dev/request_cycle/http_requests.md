**What are some common HTTP status codes?**
- 200 indicating the status is "ok"
- 307 for redirect
- 404 error for pages that can't be found for whatever reason
- 400 for the request not being understood by the server (quite possibly due to syntax error in request)
- A reference: https://www.smartlabsoftware.com/ref/http-status-codes.htm
- A reference detailing common errors: https://www.globo.tech/learning-center/5-most-common-http-error-codes-explained/

**What is the difference between a GET request and a POST request? When might each be used?**
- Reference: https://www.w3schools.com/tags/ref_httpmethods.asp
- GET requests data from a source
- POST requests data be passed/processed to a specific resource
- Conceptually it's a bit like GET takes data while POST gives data.  GET is commonly used to retrieve HTML, CSS, script, and image files from a web server so that the client can have their browser render it and run the corresponding programming.  POST might be used for something like transferring data like a "status update" to ones feed, photo, or form submission from client to server.


**Optional bonus question: What is a cookie (the technical kind, not the delicious kind)? How does it relate to HTTP requests?**
- Cookies are small pieces of data taken from web site servers and stored by a users web browser on their local computer.  They are commonly used to log information about the state of the web application on a temporary basis.  An example of how it's related to HTTP requests can be found in common usage of **authentication cookies** which confirm whether or not a user is logged and can strongly increase security of sensitive data if they are encrypted.  If a user has an authentication cookie that the server can verify through the GET HTTP request, it can safely grant access to sensitive data being requested from the server.  Various cookie types can serve various purposes but generally the purpose of the cookie is executed be shaping the nature of HTTP requests based on data stored in cookies or cookie status.

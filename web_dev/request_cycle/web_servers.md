**What are some of the key design philosophies of the Linux operating system?**
- Reference: https://en.wikipedia.org/wiki/Unix_philosophy
- Reference: https://opensource.com/business/15/2/how-linux-philosophy-affects-you
- Reference: http://www.science.unitn.it/~fiorella/guidelinux/gs/node22.html
- This is good short summary(from the wikipedia article above) of the UNIX philosophy that the open source project of Linux is based on:
  - Write programs that do one thing and do it well.
  - Write programs to work together.
  - Write programs to handle text streams, because that is a universal interface.
- Linux also espouses the open source and free software initiatives

**In your own words, what is a VPS (virtual private server)? What, according to your research, are the advantages of using a VPS?**
A VPS is a block of memory and storage space that can be purchased from VPS service providers over the web and used to store content and respond to HTTP requests.  They are great to have as a scalable server solution that can adapt to changes in the volume of requests it's receiving.  They can easily be accessed remotely and preserve the safety of one's local system by providing a programming space where one's local development environment isn't at risk.  They are cost effective and don't require as much physical space since they aren't being run on their own individual computer hardware.

**Optional bonus question: Why is it considered a bad idea to run programs as the root user on a Linux system?**
Because it's a security risk since there are limited password, login, or encryption features setup to protect the contents of the server from attacks by nefarious evil doers.  Furthermore, if multiple people will be working on development in the server it would be sensible to have user logins for administrative and organizational purposes.

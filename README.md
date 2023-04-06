# subaligner-wsgi
This repository contains instructions for building a containerized WSGI 
server for subtitle alignment. It assumes you have at least one running [subaligner-worker](https://github.com/albeltra/subaligner-worker)
which will perform the actual alignment.

Prerequisites: A running redis server.

### Running the Container
You can build the image yourself: <br>
```
git clone https://github.com/albeltra/subaligner-wsgi --recrusive
cd subaligner-wsgi
docker build -t subaligner-wsgi .
```
Then run it using your freshly built image or mine. At minimum, you must properly
map your media directories and specify the host and port of your existing redis installation:

```
docker run \
       -v /movies:/movies \
       -v /tv:/tv \
       -e REDIS_HOST=<IP OR HOST NAME> \
       -e REDIS_PORT=<PORT> \
       beltranalex928/subaligner-wsgi \
```

You can additionally specify the timeout parameter for all jobs using the TIMEOUT env variable (default is 1000 s):
```
docker run \
       -v /movies:/movies \
       -v /tv:/tv \
       -e REDIS_HOST=<IP OR HOST NAME> \
       -e REDIS_PORT=<PORT> \
       -e TIMEOUT=1000 \
       beltranalex928/subaligner-worker \
```

### Start the Subaligner Worker(s)
Be sure to set up at least on rq worker to start launching jobs. Check out the 
instructions [here](https://github.com/albeltra/subaligner-worker)
# Steps

On your host, install these tools

- [Install](https://docs.docker.com/engine/install/ubuntu/) docker
- [Install](https://docs.docker.com/desktop/install/linux-install/) docker-compose
- Install GNU/Make if you don't have it (you really should have it, but just in case) `sudo apt install -y make`
- `sudo apt install -y kcachegrind` (this is a gui for the profile)
- `sudo apt install apache2-utils` (this will provide you with ab, the apache benchmark tool)
- (**Optional**) Create a virtualenv, I use pyenv. I'm using the same version as the Dockerfile (python 3.10.4)
- Install the requirements.txt (pip install -r requirements.txt)

# Terminology

host: your linux machine
guest: the dockerized project

## Preparing the image for the first time

You will only run the target make network once
You will run make web_image anytime you change the Dockerfile

- `make network`
- `make web_image`

## Running

`docker-compose up -d arthur_web`

That will launch the docker-compose web project

Now you want to run the ab tool to simulate 10 concurrent users
that will execute up to 100 requests

```ab -k -c 10 -n 100 http://localhost:8000/greet/```

See [this](https://stackoverflow.com/questions/12732182/ab-load-testing)
to understand what we are doing

After that finishes, you will have a new file in your directory, called gunicorn.profile
you don't have to call it that, I'm just not a creative person.

To open that file and see the fancy chart, on your host type this

`pyprof2calltree -i gunicorn.profile -k`

You will see a big "sleep" function call that consumes all the time

### Extra

About the project, I configured the gunicorn with 4 workers ,you can see the
arguments on how I launch it in the .env file
The Dockerfile CMD part has the profile and gunicorn run.

I added hooks `-c hooks_config.py` [here is the documentation](https://docs.gunicorn.org/en/stable/settings.html#server-hooks)
To show when a worker starts, reloads, it's just an example,
but you guys can use it on your heroku

## How do I stop this thing?

On your host, type docker-compose down and it will stop the running project

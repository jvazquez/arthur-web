FROM python:3.10.4
RUN mkdir app
COPY ./requirements.txt app/
WORKDIR app
RUN pip install -r requirements.txt
CMD ["python", "-m" ,"cProfile", "-o", "gunicorn.profile","/usr/local/bin/gunicorn", "arthur.wsgi"]
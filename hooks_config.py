def on_starting(server):
    """Do something on worker start"""
    print(f"Hi there, this is the gunicorn worker. We have started."
          f"{server.__dict__}")


def on_reload(server):
    """
     Do something on reload
    """
    print("Hi there, this is the gunicorn server. We have been restarted.")


def post_worker_init(worker):
    """
    Do something on worker initialization
    """
    print("Hi there, this is a gunicorn worker. We have been initialized."
          "Worker Process id –>", worker.pid)

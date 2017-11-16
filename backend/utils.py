import time


def stop_watch(func):
    def wrapper(*args, **kwargs):
        start_time = time.time()
        r = func(*args, **kwargs)
        end_time = time.time()
        print("/*** Invoke :{0} ,elapsed:{1:.2f} ms **/".format(func.__name__, (end_time - start_time) * 1000))
        return r

    return wrapper

import time


def time_function(func):
    start_time = time.time()
    result = func()
    end_time = time.time()
    elapsed_time = end_time - start_time
    return result, elapsed_time

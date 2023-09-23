import time


def time_function(func):
    def timed_func(*args, **kwargs):
        start_time = time.time()
        result = func(*args, **kwargs)
        end_time = time.time()
        elapsed_sec = end_time - start_time
        print(f"Elapsed time calling {func.__name__}(): {elapsed_sec:.1f} seconds")
        return result

    return timed_func

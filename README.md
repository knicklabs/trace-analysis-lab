# Trace Analysis Lab

This is a portable lab for trace analysis. That is, it should work in various operating systems (i.e. Windows, Mac, Linux) via Docker.

Use this lab to analyze traces in Common Trace Format (CTF) in Jupyter notebooks using the Babeltrace 2 Python Bindings. To help with data wrangling and analysis, the Pandas and Matplotlib Python libraries are installed.

## Instructions

- Install Docker via [Getting Started with Docker](https://www.docker.com/get-started/)
- On a Mac, you may want to use [OrbStack](https://orbstack.dev) instead of Docker as it tends to be faster.
- From the terminal in this project directory, build and run the Jupyter Lab server by running `docker compose -f docker-compose.dev.yml up --build -d`.
- Visit [http://127.0.0.1/lab](http://127.0.0.1/lab) in your browser.
- Open the `syscall_durations.ipynb` file and try running it (see note about copying a trace into the project and editing the path to the trace in the [Notes](#notes) section).
- When you are done, run `docker compose -f docker-compose.dev.yml down` to stop and remove containers, volumes, and images.

## How to Use

- Make sure you have the server running
- Add your traces to `/notes/traces`
- Use Jupyter lab to add Python3 notebooks to `/notes`.
- See [syscall_durations.ipynb](http://127.0.0.1:9000/lab/tree/syscall_durations.ipynb) for an example of loading a trace and working with. Also see [Babeltrace 2 Python Bindings Documentation](https://babeltrace.org/docs/v2.0/python/bt2/).

## Notes

If you're using the example `syscall_durations.ipynb`, make sure to put a kernel trace that has syscall events captured into `notes/traces` and update this line:

```python
msg_it = bt2.TraceCollectionMessageIterator("traces/example")
```

Replace `example` with the name of your trace directory.

Sample traces were not included in this repository due to their large size.

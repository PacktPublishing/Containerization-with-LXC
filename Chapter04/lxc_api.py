import lxc
from bottle import run, request, get, post


@post('/build')
def build():
    name = request.headers.get('X-LXC-Name')
    memory = request.headers.get('X-LXC-Memory')
    template = str(request.headers.get('X-LXC-Template'))

    container = lxc.Container(name)
    container.create(template)

    return "Building container {0} using the {1} template\n".format(name, template)


@post('/container/<name>/start')
def container_start(name):
    container = lxc.Container(name)
    container.start(useinit=False, daemonize=True)

    return "Starting container {0}\n".format(name)


@post('/container/<name>/stop')
def container_start(name):
    container = lxc.Container(name)
    container.stop()

    return "Stopping container {0}\n".format(name)


@post('/container/<name>/destroy')
def container_start(name):
    container = lxc.Container(name)
    container.destroy()

    return "Destroying container {0}\n".format(name)


@post('/container/<name>/freeze')
def container_start(name):
    container = lxc.Container(name)
    container.freeze()

    return "Freezing container {0}\n".format(name)


@post('/container/<name>/unfreeze')
def container_start(name):
    container = lxc.Container(name)
    container.unfreeze()

    return "Unfreezing container {0}\n".format(name)


@get('/container/<name>/state')
def container_status(name):
    container = lxc.Container(name)
    state = container.state

    return "The state of container {0} is {1}\n".format(name, state)


@get('/container/<name>/ips')
def container_status(name):
    container = lxc.Container(name)
    ip_list = container.get_ips()

    return "Container {0} has the following IP's {1}\n".format(name, ip_list)


@get('/list')
def list():
    container_list = lxc.list_containers()

    return "List of containers: {0}\n".format(container_list)


run(host='localhost', port=8080, debug=True)
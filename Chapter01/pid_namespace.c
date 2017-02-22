#define _GNU_SOURCE
#include <stdlib.h>
#include <stdio.h>
#include <signal.h>
#include <sched.h>

static int childFunc(void *arg)
{
    printf("Process ID in child  = %ld\n", (long) getpid());
}

static char child_stack[1024*1024];

int main(int argc, char *argv[])
{
    pid_t child_pid;

    child_pid = clone(childFunc, child_stack + (1024*1024), CLONE_NEWPID | SIGCHLD, NULL);

    printf("PID of cloned process: %ld\n", (long) child_pid);
    waitpid(child_pid, NULL, 0);
    exit(EXIT_SUCCESS);
}

#Containerization with LXC
This is the code repository for [Containerization with LXC](https://www.packtpub.com/virtualization-and-cloud/containerization-lxc?utm_source=github&utm_medium=repository&utm_campaign=9781785888946), published by [Packt](https://www.packtpub.com/?utm_source=github). It contains all the supporting project files necessary to work through the book from start to finish.
## About the Book
In recent years, containers have gained wide adoption by businesses running a variety of application loads. This became possible largely due to the advent of kernel namespaces and better resource management with control groups (cgroups). Linux containers (LXC) are a direct implementation of those kernel features that provide operating system level virtualization without the overhead of a hypervisor layer.

This book starts by introducing the foundational concepts behind the implementation of LXC, then moves into the practical aspects of installing and configuring LXC containers. Moving on, you will explore container networking, security, and backups. You will also learn how to deploy LXC with technologies like Open Stack and Vagrant. By the end of the book, you will have a solid grasp of how LXC is implemented and how to run production applications in a highly available and scalable way.

##Instructions and Navigation
All of the code is organized into folders. Each folder starts with a number followed by the application name. For example, Chapter02.



The code will look like the following:
```
#define _GNU_SOURCE
#include<stdlib.h>
#include<stdio.h>
#include<signal.h>
#include<sched.h>
 
staticintchildFunc(void *arg)
{
  printf("UID inside the namespace is %ld\n", (long) geteuid());
  printf("GID inside the namespace is %ld\n", (long) getegid());
}
```

A beginner-level knowledge of Linux and the command line should be enough to follow along and run the examples. Some Python and C knowledge is required to fully understand and experiment with the code snippets, though the book is not about software development and you can skip Chapter 4, LXC Code Integration with Python altogether, if not interested.

In terms of hardware and software requirements, most examples in the book have been tested in virtual machines utilizing various cloud providers such as Amazon AWS and Rackspace Cloud. We recommend using the latest version of Ubuntu, given Canonical's involvement with the LXC project, though we provide examples with CentOS whenever the installation/operation methods diverge.

##Related Products
* [Learning Docker Networking](https://www.packtpub.com/networking-and-servers/learning-docker-networking?utm_source=github&utm_medium=repository&utm_campaign=9781785280955)

* [Xen Virtualization](https://www.packtpub.com/virtualization-and-cloud/xen-virtualization?utm_source=github&utm_medium=repository&utm_campaign=9781847192486)

* [Learning OpenStack Networking (Neutron) - Second Edition](https://www.packtpub.com/virtualization-and-cloud/learning-openstack-networking-neutron-second-edition?utm_source=github&utm_medium=repository&utm_campaign=9781785287725)

###Suggestions and Feedback
[Click here](https://docs.google.com/forms/d/e/1FAIpQLSe5qwunkGf6PUvzPirPDtuy1Du5Rlzew23UBp2S-P3wB-GcwQ/viewform) if you have any feedback or suggestions.

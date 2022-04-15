To start, we first create a new playbook **mangodb.yml** for this task, and open it:

`touch mangodb.yml`{{execute HOST1}}
`mangdb.yml`{{open}}

## Create MangoDB container

Docker provides a MangoDB container, which makes it extremely convenient to set up MangoDB. To do this task with Ansible, simply copy the following YAML to **mangodb.yml**:

<pre class="file" data-filename="mangodb.yml" data-target="replace">---
- name: Setup MangoDB
  hosts: localhost
  tasks:
    - name: Create Mongo Container
      docker_container:
        name: MongoDB
        image: mongo
        ports: 
          - 28017:28017
        networks: 
          - name: mynetwork
            ipv4_address: 173.18.0.2
</pre>

We connected the container to the docker network with a fixed ip and expose port 28017. This task will create and start the container.

`ansible-playbook mangdb.yml`

## Test the database

Now lets test whether our MangDB is actually created and running.

Copy the following YAML to **mangodb.yml**:

<pre class="file" data-filename="mangodb.yml" data-target="replace">

    - name: Show MangoDB version
      community.docker.docker_container_exec:
        container: MangoDB
        command: 
      register: result

    - name: Print result
      debug:
        var: result.stdout
</pre>
# Using Docker *Portable*

## How to use?

1. `docker` should be installed on machine.
2. run in terminal:
    ```bash
    sudo chmod u+x run.sh
    ./run.sh
    ```
3. go to `http://localhost:5000/v2/_catalog` to see available images.
4. how to pull image:
    ```bash
    sudo docker pull localhost:5000/<image-name>
    ```
5. it's done!

> TODO: 
> add `{"registry-mirrors": ["http://localhost:5000"]}`
> to /etc/docker/daemon.json file for pull without need to write `localhost:5000` before image



## Docs

- pull registry image from `Dockerub`
    ```bash
    sudo docker pull registry
    ```
    
- store pulled images on your machine in file for transfering
    ```bash
    docker save -o <save-location>/<file-name>.tar <image-name>
    ```

- load image from file to machine
    ```bash
    docker load -i <image-file-path>.tar
    ```

- run image to specific volume (for read and write)
    ```bash
    sudo docker run --rm -v ./regvol:/var/lib/registry --name hooshan-registry -p 5000:5000 registry
    ```

- add image to registry:
    ```bash
    sudo docker tag <image-name> <your-registry-address>/<image-name>
    sudo docker rmi <image-name> -f
    sudo docker push <your-registry-address>/<image-name>
    ```

- remove all docker images:
    ```bash
    sudo docker rmi -f $(sudo docker images -aq)
    ```

- remove all docker containers:
    ```bash
    sudo docker rm -vf $(sudo docker ps -aq)
    ```# docker-portable

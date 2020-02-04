# IMPORTANT

If using docker-compose - if the database initialisation script isn't working/performing as expected, delete everything from the mapped data directory (in data, but leave the folder there).

Docker commands that are useful:

- Build the web image (in isolation)

   ```docker build -t lms .```

- Run the web image (in isolation)

    ```docker run -d --name lms1 -p 9024:80 lms```

- Delete all running containers, and remove images (NOTE: ALL Containers, not just related to this project)

    ```docker rm -f $(docker ps -aq) | docker image rm -f $(docker image ls -aq) | docker volume prune -y```

- Build all the things in docker-compose

    ```docker-compose up --build```

To open the website [http://localhost:8735](http://localhost:8735)

## Docker creation for benchmark

 - pull docker hseeberger/scala-sbt
 - list ALL containers : sudo docker ps --all
 - create container (--name scala_2.12) +  start it (-i interactive) [BUG docker attach ?]
    => correct command : sudo docker run -it mgobench
 - copy repo to container (could clone it ?)
 - inside container : install gcc, install locate, run python build.by ;
    * test : missing local lib (akka-multiswarm) -> clone and publishLocal
    * modify harcoded path in build.sbt (java library path)
 - commit container to image : sudo docker commit CONTAINER IMAGE_NAME
 - export image to tgz : sudo docker save IMAGE | gzip > FILE.tgz
 - command to run the launcher in the image sudo docker run -it mgobench sh -c "cd /home/mgo-benchmark; sbt \"run all 5 0 100 10 1.0 10 10\""

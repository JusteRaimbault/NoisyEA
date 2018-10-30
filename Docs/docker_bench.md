
## Docker creation for benchmark

 - pull docker hseeberger/scala-sbt
 - create container (--name scala_2.12)
 - start it (-i interactive)
 - copy repo to container (could clone it ?)
 - inside container : install gcc, install locate, run python build.by ; test : missing local lib (akka-multiswarm) -> clone and publishLocal, modify harcoded path in build.sbt

name := "thinpad"

version := "0.0.1"

scalaVersion := "2.12.10"

resolvers ++= Seq(
  Resolver.sonatypeRepo("snapshots"),
  Resolver.sonatypeRepo("releases")
)

val defaultVersions = Map(
  "rocketchip" -> "1.2.2",
  )

libraryDependencies ++= Seq("rocketchip").map {
  dep: String => "edu.berkeley.cs" %% dep % sys.props.getOrElse(dep + "Version", defaultVersions(dep)) }

scalacOptions ++= Seq("-Xsource:2.11")

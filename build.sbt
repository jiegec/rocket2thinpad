lazy val rocketChip = RootProject(file("rocket-chip/"))

lazy val root = (project in file("."))
  .settings(
    name := "thinpad",
    organization := "berkeley",
    version := "1.0",
    scalaVersion := "2.12.10",
    parallelExecution := false,
    traceLevel := 15,
    scalacOptions := Seq("-unchecked", "-deprecation", "-Xsource:2.11", "-feature", "-language:reflectiveCalls")
  ).dependsOn(rocketChip)
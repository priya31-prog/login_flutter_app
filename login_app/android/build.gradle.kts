allprojects {
    repositories {
        google()
        mavenCentral()
    }  
}


  buildscript {
       repositories {
           google() // Add this line
           mavenCentral() // This line is usually already present
       }
       dependencies {
           classpath("com.android.tools.build:gradle:7.0.4") // Ensure this is the correct version
          
       }
   }

   plugins{
    id("com.google.gms.google-services") version "4.4.2" apply false
   }


val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}

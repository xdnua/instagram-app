import org.gradle.api.tasks.Delete
import org.gradle.api.file.Directory

buildscript {
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        classpath("com.android.tools.build:gradle:8.7.0")
        classpath("com.google.gms:google-services:4.3.15")
        classpath(kotlin("gradle-plugin", version = "2.0.21"))
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// Thiết lập build dir cho project và subproject
val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

subprojects {
    project.evaluationDependsOn(":app")
}

// Task clean
tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}

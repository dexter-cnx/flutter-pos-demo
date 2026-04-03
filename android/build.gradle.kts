// Redirect build output to {projectRoot}/build so Flutter tooling can find the APK.
// Required for Gradle 8.14 + AGP 8.11 where the automatic redirect no longer works.
val newBuildDir = rootProject.layout.projectDirectory.dir("../build")
rootProject.layout.buildDirectory.set(newBuildDir)

subprojects {
    val newSubBuildDir = newBuildDir.dir(project.name)
    project.layout.buildDirectory.set(newSubBuildDir)
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

subprojects {
    project.evaluationDependsOn(":app")
}

// Fix for AGP 8.0+ namespace requirement in older plugins like isar_flutter_libs
subprojects {
    plugins.withId("com.android.library") {
        val android = extensions.getByName("android")
        try {
            val getNamespace = android.javaClass.getMethod("getNamespace")
            val setNamespace = android.javaClass.getMethod("setNamespace", String::class.java)
            if (getNamespace.invoke(android) == null) {
                setNamespace.invoke(android, project.group.toString())
            }
        } catch (e: Exception) {}
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}

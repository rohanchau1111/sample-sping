/com/precisely/b2b/fg-rest-app/1.0-feature_sfg20test-SNAPSHOT
 implementation 'com.precisely.b2b:fg-rest-app:1.0-feature_sfg20test-SNAPSHOT@zip'

 https://abd/artifactory/libs-snapshot-local/com/precisely/b2b/fg-rest-app/1.0-feature_sfg20test-SNAPSHOT/fg-rest-app-1.0-feature_sfg20test-20240917.080749-7-fg-liberty.zip
plugins {
    id 'java'
    id 'war'
    id 'maven-publish'
    id 'org.springframework.boot' version '3.3.2'
    id 'io.spring.dependency-management' version '1.1.6'
}

group = 'com.example'
version = '0.0.1-SNAPSHOT'

java {
    toolchain {
        languageVersion = JavaLanguageVersion.of(17)
    }
}

repositories {
    mavenCentral()
    maven {
        url = uri('https://artifactory.syncdi1.us.syncsort.com/artifactory/libs-snapshot-local/')
        credentials {
            username = 'pem-publisher'
            password = 'publisher-for-pem'
        }
    }
}

dependencies {
    implementation 'org.springframework.boot:spring-boot-starter-web'
    
    // WAR file dependency
    implementation 'com.precisely.b2b.identity:identity-svc:1.0-feature_identity_liberty-SNAPSHOT@war'
    
    // ZIP file dependency
    implementation 'com.precisely.b2b.identity:identity-svc:1.0-feature_identity_liberty-SNAPSHOT@zip'
    
    providedRuntime 'org.springframework.boot:spring-boot-starter-tomcat'
    testImplementation 'org.springframework.boot:spring-boot-starter-test'
    testRuntimeOnly 'org.junit.platform:junit-platform-launcher'
}

configurations {
    resolvedImplementation {
        canBeResolved = true
        canBeConsumed = false
        extendsFrom configurations.implementation
    }
}

task ensureDependenciesResolved {
    doLast {
        configurations.resolvedImplementation.resolve()
    }
}

tasks.register('copyDependencies', Copy) {
    dependsOn ensureDependenciesResolved
    from {
        configurations.resolvedImplementation.resolvedConfiguration.resolvedArtifacts.collect { artifact ->
            if (artifact.file.name.endsWith('.war') || artifact.file.name.endsWith('.zip')) {
                return artifact.file // Collect both WAR and ZIP files
            }
        }
    }
    into "$buildDir/libs"
}

tasks.register('printDependencyPath') {
    doLast {
        configurations.runtimeClasspath.resolvedConfiguration.resolvedArtifacts.each { artifact ->
            if (artifact.file.name.endsWith('.war') || artifact.file.name.endsWith('.zip')) {
                println "Dependency file path: ${artifact.file.absolutePath}"
            }
        }
    }
}

tasks.named('build') {
    dependsOn 'copyDependencies'
    dependsOn 'printDependencyPath'
}

tasks.named('test') {
    useJUnitPlatform()
}

plugins {
    id 'identity-config-java-library'
    id 'identity-config-lombok'
    id 'identity-config-springboot'
    id 'java'
    id 'war'
    id 'maven-publish'
    id 'com.jfrog.artifactory' version '5.1.12'
    id 'jacoco'
}

dependencies {
    implementation project(':b2bi-identity')
    implementation project(':pem-identity')
    runtimeOnly project(':identity-ui')
    
    // Ref - https://docs.spring.io/spring-boot/docs/3.0.4/gradle-plugin/reference/htmlsingle/#packaging-executable
    // Add embedded tomcat as providedRuntime. This ensures it is packaged in the 
    // war file’s WEB-INF/lib-provided directory from where they will not conflict 
    // with the external container’s own classes.
    providedRuntime('org.springframework.boot:spring-boot-starter-tomcat')
    
    implementation 'org.springframework.boot:spring-boot-starter-oauth2-authorization-server'
    implementation 'org.springframework.boot:spring-boot-starter-security'
    implementation 'org.springframework.boot:spring-boot-starter-web'
    implementation 'org.springframework.boot:spring-boot-starter-data-jpa'
    implementation 'org.springframework.boot:spring-boot-starter-thymeleaf'
    
    implementation 'com.ibm.db2.jcc:db2jcc:db2jcc4'
    implementation 'com.microsoft.sqlserver:mssql-jdbc:9.4.0.jre11'
    implementation 'com.oracle.database.jdbc:ojdbc8:12.2.0.1'

    testImplementation 'org.springframework.boot:spring-boot-starter-test'
   testImplementation('junit:junit:4.13.2')
}

springBoot {
    mainClass = 'com.precisely.b2b.identity.server.IdentityServiceApplication'
}


test {
     finalizedBy jacocoTestReport
     useJUnitPlatform()
}

jacocoTestReport {
    reports {
        xml.required.set(true)
        csv.required.set(true)
        html.required.set(true)
    }
}


jacocoTestCoverageVerification {
   violationRules {
       rule {

   limit {
      minimum = 0.1
 }
}
}
}


task copyWebApp(type: Copy) {
    dependsOn ':identity-ui:build'  
  //  dependsOn ':identity-svc:jar'
    //from zipTree(project(':identity-ui').tasks.getByName('bundle').outputs.files.singleFile)
    from file("${rootDir}/identity-ui/packages/login/build/dist/")
    into file("${buildDir}/resources/main/static/")
}

def tasksToConfigure = ['bootWar', 'war', 'jar', 'resolveMainClassName', 'pmdMain']
tasksToConfigure.each { taskName ->
    tasks.named(taskName) {
      
        dependsOn tasks.named('copyWebApp')

    }
}

publishing {
    publications {
 
        bootJava(MavenPublication) {
            def BranchId = branchId.replaceAll('/', '_') 
            version = "${version}-${BranchId}-SNAPSHOT" 
           // artifactId = "${project.name}"
            from components.web
            artifact tasks.named("bootWar")
            
             artifact("${projectDir}/application_sample.yml") {
             classifier = 'application_sample'
             extension = 'yml'
         }
          
         artifact("${project.rootDir}/identity-liberty/build/distributions/identity.zip") {
              classifier = 'identity'
               extension = 'zip'
             }
           //  artifact("${projectDir}/application_sample.yml") {
             //classifier = 'application_sample'
             //extension = 'yml'
           }
        }
    
}


artifactory {
    publish {
        contextUrl = "$artifactoryURL"
        repository {
            repoKey = "$artifactoryRepo"
            username = "$artifactoryUser"
            password = "$artifactoryPassword"
        }
        defaults {
            publications('mavenJava','bootJava') 
        //    publications('bootJava') 
            publishArtifacts = true
            publishPom = true
        }
    }
}
 

tasks.named('test') {
        useJUnitPlatform()
}
